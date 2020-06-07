import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/User/test2.dart';

class hhh extends StatelessWidget {
final User following;
  hhh({ this.following });

  @override
  Widget build(BuildContext context) {
    return new PlanetRow(following: following,); 
        
      
    
  }
}