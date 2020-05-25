/*import 'package:flutter/material.dart';
import 'package:flutter_app/models/Rating.dart';
import 'package:flutter_app/screens/authenticate/OnBorder.dart';
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
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password );
                         // Navigator.push(context,MaterialPageRoute(builder: (context)=> regsec()  ) );                      
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
      ),
   ));
    }
}
*/