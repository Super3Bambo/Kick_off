import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';

import 'FollowingItemcontent.dart';

class FollowingItemsahpe extends StatelessWidget {
final User following;
  FollowingItemsahpe({ this.following });

  @override
  Widget build(BuildContext context) {
    return new FollowingItemcontent(following: following,); 
        
      
    
  }
}