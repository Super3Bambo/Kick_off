import 'package:flutter/material.dart';
import '../../Services/Auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../Shared/Loading.dart';



class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  // text field state
  String email = '';
  String password = '';
  String fName, lName, age, position, area, phone;

  @override
    Widget build(BuildContext context) {
      return  loading? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
        title: Text('Sign up to Kick Off'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
   body: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
      child: Form(
        key: _formKey,
         
        child: Column(children: <Widget>[
          SizedBox(height: 15.0,),
            TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val); }
                ),
             
             
          SizedBox(height: 15.0,),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.length == 8 ? 'Enter a password no less 8 chars ' : null,
                onChanged: (val) {
                  setState(() => password = val);}
            ),


SizedBox(height: 15.0,),
            TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Frist Name",
              border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                onChanged: (val) {
                  setState(() => fName = val); }
                ),
             
             
          SizedBox(height: 15.0,),
            TextFormField(
              decoration: InputDecoration(
                
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Last Name",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.length == 8 ? 'Enter Your Last Name ' : null,
                onChanged: (val) {
                  setState(() => lName = val);}
            ),

            SizedBox(height: 15.0,),
              TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Age",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.length == 8 ? 'Enter Your Age ' : null,
                onChanged: (val) {
                  setState(() => age = val);}
            ),

            SizedBox(height: 15.0,),
              TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "area",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.length == 8 ? 'Enter Your area ' : null,
                onChanged: (val) {
                  setState(() => area = val);}
            ),


            SizedBox(height: 15.0,),
             TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "position",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.length == 8 ? 'Enter Your position ' : null,
                onChanged: (val) {
                  setState(() => position = val);}
            ),




           SizedBox(height: 15.0,),
             TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Phone",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.length == 8 ? 'Enter Your Phone ' : null,
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
                  if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password ,fName, lName, age, position, area, phone);
                    if(result == null) {
                      setState(() {
                     Alert(context: context, title: "Invalid data",desc: "Enter valid email" ).show();
                      loading = false;

                      });
                    }
                  }
                }
              ),
              



        ],)
      ),
    ));
    }
}
