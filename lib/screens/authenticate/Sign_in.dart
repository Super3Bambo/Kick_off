import 'package:flutter/material.dart';
import '../../Services/Auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../Shared/Loading.dart';



class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
    Widget build(BuildContext context) {
      return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
        title: Text('Sign in to Kick Off'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
   body: Container(
     decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("images/background4.jpg"),
    fit: BoxFit.cover,
    )),
      padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                 
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
            hintStyle: TextStyle(color: Colors.grey),
              border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              validator: (val) => val.isEmpty ? 'email not found' : null,
                onChanged: (val) {
                  setState(() => email = val); }
                ),
             
             
          SizedBox(height: 20.0,),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.length == 8 ? ' password not correct  ' : null,
                onChanged: (val) {
                  setState(() => password = val);}
            ),

             SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blueGrey[300],
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                     Alert(context: context, title: "Invalid data",desc: " invalid email or password" ).show();
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
