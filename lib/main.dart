import 'package:flutter/material.dart';
import './screens/warpper.dart';
import './Services/Auth.dart';
import './models/User.dart';
import 'package:provider/provider.dart';
import './screens/Fields_screens/Field_Details.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
         //   FieldDetails.routeName: (ctx) => FieldDetails(),
        },
        
      ),
    );
    }
    }