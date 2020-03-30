import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Shared/Loading.dart';
import '../../Services/User.dart';
import '../../models/User.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';





class Edituser extends StatefulWidget {
  @override
  _EdituserState createState() => _EdituserState();
}

class _EdituserState extends State<Edituser> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String fName='', lName, age, position, area, phone;
      File _image;
      
      

  @override
  Widget build(BuildContext context) {
    String photo ;

Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
      });
    }
    Future uploadPic(BuildContext context) async{
    String fileName = basename(_image.path);
       StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
       StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
       StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    }
    



        User user = Provider.of<User>(context);

return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData==null){
          return Loading();
         
    }else {
        
         User userData = snapshot.data;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
        title: Text('Edit Profile'),
      ),
   body: Container(
        child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            SizedBox(height: 20.0,),
              TextFormField(
                initialValue: userData.FName,
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Frist Name",
                border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                  onChanged: (val) {
                    setState(() => fName = val); }
                  ),
               
               
            SizedBox(height: 20.0,),
              TextFormField(
                initialValue: userData.LName,
                decoration: InputDecoration(
                  
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Last Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

                validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                  onChanged: (val) {
                    setState(() => lName = val);}
              ),

              SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: userData.Age,
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Age",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

                validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                  onChanged: (val) {
                    setState(() => age = val);}
              ),

              SizedBox(height: 20.0,),
                TextFormField(
                initialValue: userData.Area,
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "area",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

                validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                  onChanged: (val) {
                    setState(() => area = val);}
              ),


              SizedBox(height: 20.0,),
               TextFormField(
                initialValue: userData.Position,
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "position",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

                validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                  onChanged: (val) {
                    setState(() => position = val);}
              ),




             SizedBox(height: 20.0,),
               TextFormField(
                 initialValue: userData.Phone,
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Phone",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

                validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                  onChanged: (val) {
                    setState(() => phone = val);}
              ),


                  SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff476cfb),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):Image.network(
                            userData.Photo_url,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                    Padding(
                      padding: EdgeInsets.only(left: 100.0),
                      
                      child: IconButton(
                        
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          size: 30.0,
                        ),
                        onPressed: () {
                          getImage();
                           
                        },
                      ),
                    ),],
              ),

               SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[300],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                   // uploadPic(context);
      
                   
                    if(_formKey.currentState.validate()){
                     var fileName = basename(_image.path);
                          var firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
                          var uploadTask = firebaseStorageRef.putFile(_image);
                         var photo = await (await uploadTask.onComplete ).ref.getDownloadURL();
                      await UserService(userid: user.ID).updateUserData(
                        fName ?? userData.FName,
                        lName ?? userData.LName,
                        age ?? userData.Age,
                        position ?? userData.Position,
                        area ?? userData.Area,
                        phone ?? userData.Phone,
                        photo.toString() ?? userData.Photo_url
                             );
                              Navigator.pop(context);

                    }

                  }
                ),
                
           


          ],
          )
        ),
      ),
   )
    );
    }
    }
    ,);
    }
}

  