import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';

import 'FollowingItemcontent.dart';
import 'followersitemcontent.dart';

class Tempfollow extends StatelessWidget {
  var title;
Tempfollow({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title),),);
        
      
    
  }
}