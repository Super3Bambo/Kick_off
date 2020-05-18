import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/models/Rating.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../Shared/Loading.dart';



class completeRegister extends StatefulWidget {
         static const routeName = '/regcomplete';



  @override
  _completeRegisterState createState() => _completeRegisterState();
}

class _completeRegisterState extends State<completeRegister> {

  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  // text field state
  String fName, lName, age, position, area, phone;
  List<Field> date=[
    Field (Date: DateTime.now().toString())
  ];
  
  List<UserRating> rating=[
    UserRating(  Skills:0 , Morality: 0, Position_Skills: 0 )
  ];
  @override
    Widget build(BuildContext context) {
          final user = Provider.of<User>(context);

      return  loading? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
        title: Text('Compelete Your Information'),
      ),
   body:  Container(
        child: SingleChildScrollView(
       
        padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
        child: Form(
          key: _formKey,
           
          child: Column(children: <Widget>[


            SizedBox(height: 15.0,),
              TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Frist Name",
                border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                //validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                  onChanged: (val) {
                    setState(() => fName = val); }
                  ),
               
               
            SizedBox(height: 15.0,),
              TextFormField(
                decoration: InputDecoration(
                  
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Last Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

              // validator: (val) => val.length == 8 ? 'Enter Your Last Name ' : null,
                  onChanged: (val) {
                    setState(() => lName = val);}
              ),

              SizedBox(height: 15.0,),
                TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Age",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

               //validator: (val) => val.length == 8 ? 'Enter Your Age ' : null,
                  onChanged: (val) {
                    setState(() => age = val);}
              ),

              SizedBox(height: 15.0,),
                TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "area",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

               //validator: (val) => val.length == 8 ? 'Enter Your area ' : null,
                  onChanged: (val) {
                    setState(() => area = val);}
              ),


              SizedBox(height: 15.0,),
               TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "position",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

              // validator: (val) => val.length == 8 ? 'Enter Your position ' : null,
                  onChanged: (val) {
                    setState(() => position = val);}
              ),




             SizedBox(height: 15.0,),
               TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Phone",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             //  validator: (val) => val.length == 8 ? 'Enter Your Phone ' : null,
                  onChanged: (val) {
                    setState(() => phone = val);}
              ),


               SizedBox(height: 15.0),
                RaisedButton(
                  color: Colors.pink[300],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    List<User> follow=[
                        User(ID: user.ID)
                          ];
                    FirebaseUser useres = await FirebaseAuth.instance.currentUser();
                   var token = useres.getIdToken();
                  String tok= token.then((value) => value.token).toString();
                       
                   
                    if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                    await UserService(userid: user.ID).addUserData(fName, lName, age, position, area, phone ,'h',tok ,date ,follow,rating  );  
                      }
                         loading=false;

                                        
                    }
                  
                ),
                



          ],)
        ),
      ),
   ));
    }
}
