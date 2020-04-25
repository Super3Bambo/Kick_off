import 'dart:async';
import '../../models/Matches.dart';
import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
/*
class testtwo extends StatefulWidget{
  
  final Match matchid;

  testtwo({this.matchid});
     // static const routeName = '/invite';

 
  @override
  _testtwoState createState() => _testtwoState();
}

class _testtwoState extends State<testtwo> {

 


@override
  Widget build(BuildContext context) {



return MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('dfs'),),

  ),

);

  }}
*/class DynamicLinkScreen extends StatelessWidget {
       static const routeName = '/invite';
final Match matchid;

  DynamicLinkScreen({this.matchid});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title:  Text(matchid.users.map((e) => e.ID).first.toString()),
        ),
        body:  Center(
          child: Text(matchid.Check_in.toString()),
        ),
      ),
    );
  }
}