import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';

import 'FollowingItemcontent.dart';
import 'followersitemcontent.dart';

class FollowersItemsahpe extends StatelessWidget {
final User followers;
  FollowersItemsahpe({ this.followers });

  @override
  Widget build(BuildContext context) {
    return new FollowersItemcontent(followers: followers,); 
        
      
    
  }
}