import 'package:flutter/material.dart';
//import 'package:flutter_app/screens/Matches/test.dart';
import 'package:flutter_app/screens/Matches/Invite_Page.dart';
import 'Match_Details_User.dart';
import '../../models/Matches.dart';
import 'Matches_Overview_User.dart';




class ttt extends StatelessWidget {
  final Match matchid;
  ttt({ this.matchid });
      static const routeName = '/df';

  // This widget is the root of your applicatio/n.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
 routes: <String, WidgetBuilder>{
         '/':(BuildContext context) => Match_Details(matchid: matchid,),
      '/invite': (BuildContext context) => DynamicLinkScreen(matchid: matchid,),
        },
      
    );
    }
    }