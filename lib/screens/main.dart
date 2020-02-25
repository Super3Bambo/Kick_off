import 'package:flutter/material.dart';
import 'package:flutter_app/homepage.dart';
import './Auth/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Login',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

        ),
        home: MyHomePage(title: 'Flutter Login'),
        routes: {
          '/homepage': (_) => TabbedAppBar(),
          '/registerpage': (_) => Register()
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final _auth = FirebaseAuth.instance();
String EMAIL;
String PASSWORD;

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
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
    final passwordField = TextField(
      onChanged: (value) {
        PASSWORD = value;
      },
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
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
          try{

          final user = await _auth.signInWithEmailAndPassword(email: EMAIL, password: PASSWORD);
    if (user != null) {
    Navigator.of(context).pushNamed('/homepage');
    }        } catch (e){

            print(e);
            return Alert(context: context, title: "Error",desc: "Try again" ).show();
            return e;
            }
    },
        child: Text("Login",
          textAlign: TextAlign.center,
        ),
      ),);
    final registerButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffeceff1),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushNamed('/registerpage');
        },
        child: Text("Register",
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
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
                registerButon,
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}
