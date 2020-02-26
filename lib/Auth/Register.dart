import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Register extends StatelessWidget {
final _auth = FirebaseAuth.instance;
  String ID;
  String NAME;
  String PHONENUMBER;
  String EMAIL;
  String PASSWORD;
  String PASSWORDCONFIRM;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


   final id = TextField(

      onChanged: (value) {
        ID = value;
      },
      obscureText: false,
      decoration: InputDecoration(

          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "ID",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


   final name= TextField(
      onChanged: (value) {
        NAME = value;
      },
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


   final phoneNumber= TextField(
       keyboardType:
       TextInputType.phone,
      onChanged: (value) {
        PHONENUMBER = value;
      },
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone Number +20",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


   final email= TextField(
      keyboardType:
      TextInputType.emailAddress,
      onChanged: (value) {
        EMAIL = value;
      },
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

   final password= TextField(
      obscureText: true,
      onChanged: (value) {
        PASSWORD = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

   final passwordConfirm =  TextField(
      onChanged: (value) {
        PASSWORDCONFIRM = value;
      },
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Re-Type Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final RegisterButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffeceff1),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: ()async {
          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: EMAIL, password: PASSWORD);
            if (newUser != null) {
              Navigator.of(context).pushNamed('/homepage');
            }
          }
          catch (e) {
            print(e);
return Alert(context: context, title: "Error",desc: "Try again" ).show();
return e;
          }
        },child: Text("Register",
        textAlign: TextAlign.center,
      ),
    ),
    );

    return Scaffold(
    body: Center(
      child:SingleChildScrollView(
      child: Container(
    color: Colors.indigoAccent,
    child: Padding(
    padding: const EdgeInsets.all(36.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
    SizedBox(height: 45.0),
    SizedBox(height: 45.0),
    id,
    SizedBox(height: 25.0),
    name,
    SizedBox(
    height: 15.0,
    ),
    phoneNumber,

    SizedBox(
    height: 15.0,
    ),
    email,

    SizedBox(
    height: 15.0,
    ),
    password,

    SizedBox(
    height: 15.0,
    ),
    passwordConfirm,
    SizedBox(
    height: 15.0,
    ),
    RegisterButon,
    ],
    ),
    ),
    ),
    ),
    ));
    }
  }









