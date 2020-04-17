import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Matches/Match_Details_Progress.dart';
import './screens/warpper.dart';
import './Services/Auth.dart';
import './models/User.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your applicatio/n.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
           routes:{
           }
      ),
    );
    }
    }