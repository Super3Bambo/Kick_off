import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Shared/Loading.dart';
import '../../Services/User.dart';
import '../../models/User.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';





class Editowner extends StatefulWidget {
           static const routeName = '/rrr';

  @override
  _EditownerState createState() => _EditownerState();
}

class _EditownerState extends State<Editowner> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String fName, lName, age, position, area, phone;
final List<String> positions = ['Center Forward', 'Midfielder', 'Center Back', 'GoalKeeper' , 'Select Your Position'];
bool loading = false;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          User userData = snapshot.data;
          return loading? Loading(): Scaffold (
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

                            validator: (val) => val.length == 8 ? 'Enter Your Last Name ' : null,
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

                            validator: (val) => val.length == 8 ? 'Enter Your Age ' : null,
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

                            validator: (val) => val.length == 8 ? 'Enter Your area ' : null,
                            onChanged: (val) {
                              setState(() => area = val);}
                        ),


                        // SizedBox(height: 20.0,),
                        // TextFormField(
                        //     initialValue: userData.Position,
                        //     decoration: InputDecoration(
                        //         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        //         hintText: "position",
                        //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),

                        //     validator: (val) => val.length == 8 ? 'Enter Your position ' : null,
                        //     onChanged: (val) {
                        //       setState(() => position = val);}
                        // ),


                         SizedBox(height: 20.0,),

// Container(
//             margin: EdgeInsets.only(top:5),
//             child: DropdownButtonFormField(
              
//                validator: (value) {
//                 if (value.isEmpty|| value=='Select Your Position' ) {
//                   return 'Please enter your Position';
//                 }
//               },
//              //  icon: ,
             
//               value: userData.Position?? 'Select Your Position',
//               decoration: InputDecoration(
//   fillColor: Colors.white,
//   filled: true,
//   contentPadding: EdgeInsets.all(10.0),
//   enabledBorder: OutlineInputBorder(
//     borderRadius: BorderRadius.circular(30),
//     borderSide: BorderSide(color: Colors.black, width: 0.7),
//   ),
//   focusedBorder: OutlineInputBorder(
//     borderSide: BorderSide(color: Colors.pink, width: 2.0),
//   ),
// ),
//          //   icon: Icon(Icons.track_changes),
         
//               items: positions.map((pos) {
//                 return DropdownMenuItem(
//                   value: pos,
//                   child: Text('$pos'),
//                 );
//               }).toList(), onChanged: (val) => setState(() => position = val ),
              
//               ),
//           ),


                        SizedBox(height: 20.0,),
                        TextFormField(
                            initialValue: userData.Phone,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Phone",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),

                            validator: (val) => val.length == 8? 'Enter Your Phone ' : null,
                            onChanged: (val) {
                              setState(() => phone = val);}
                        ),


                       /* SizedBox(
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
                            /*Padding(
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
                            ),*/],
                        ),*/

                        SizedBox(height: 30.0),

                        Container(
                          child:GestureDetector(
                            child:RaisedButton(
               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)
                              ),
                              padding: const EdgeInsets.all(0.0),
                              textColor: Colors.white,
                               // color: Colors.blue[700],
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius:BorderRadius.circular(20) ,
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    Color(0xFF0D47A1),
                                                    Color(0xFF42A5F5),
                                                  ],
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10.0),                                  
                                    child: Text(
                                    '                         Update                             ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),

                            onPressed: () async {
                              // uploadPic(context);
                             // if(_image!=null){
                              if(_formKey.currentState.validate()){
                              //var firebaseStorageRef = FirebaseStorage.instance.ref().child(_image.path);
                             // var uploadTask = firebaseStorageRef.putFile(_image);
                            //  photo = await (await uploadTask.onComplete ).ref.getDownloadURL();
                                setState(() => loading = true);
                                await UserService(userid: user.ID).updateownerData(
                                    fName ?? userData.FName,
                                    lName ?? userData.LName,
                                    age ?? userData.Age,
                                     userData.Position,
                                    area ?? userData.Area,
                                    phone ?? userData.Phone,
                                      userData.Photo_url,
                                      userData.TeamID,
                                      userData.Token
                                );
                              
                                loading = false;
                                Navigator.pop(context);
                              }
                             // }
                            }
                        ),

                            ),)],
                      )
                  ),
                ),
              )
          );
        }else {
          return Loading();

        }
      }
      ,);
  }
}

