import 'package:flutter/material.dart';
import './bookingFields.dart' as bookFields;
import '../../Services/Auth.dart';
class Lobby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final AuthService _auth = AuthService();


    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 200.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  /*...*/ Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bookFields.Booking()),);
                },
                child: Text(
                  "Book Now",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Participate",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                 _auth.signOut();
                  Navigator.pop(context);
                },
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}