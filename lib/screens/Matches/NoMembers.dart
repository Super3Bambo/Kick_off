import 'package:flutter/material.dart';
class TempMembers extends StatelessWidget {
  var title;
TempMembers({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title),),);
        
      
    
  }
}