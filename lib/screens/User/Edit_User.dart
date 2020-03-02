import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Shared/Loading.dart';
import '../../Services/User.dart';
import '../../models/User.dart';



class Edituser extends StatefulWidget {
  @override
  _EdituserState createState() => _EdituserState();
}

class _EdituserState extends State<Edituser> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String fName, lName, age, position, area, phone;

  @override
  Widget build(BuildContext context) {
        User user = Provider.of<User>(context);

return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          User userData = snapshot.data;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
        title: Text('Edit Profile'),
      ),
   body: Container(
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


            SizedBox(height: 20.0,),
             TextFormField(
              initialValue: userData.Position,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "position",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.length == 8 ? 'Enter Your position ' : null,
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

             validator: (val) => val.length == 8 ? 'Enter Your Phone ' : null,
                onChanged: (val) {
                  setState(() => phone = val);}
            ),


             SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[300],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    await UserService(userid: user.ID).updateUserData(
                      fName ?? userData.FName,
                      lName ?? userData.LName,
                      age ?? userData.Age,
                      position ?? userData.Position,
                      area ?? userData.Area,
                      phone ?? userData.Phone
                           );
                    Navigator.pop(context);
                  }
                }
              ),
              



        ],
        )
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

  