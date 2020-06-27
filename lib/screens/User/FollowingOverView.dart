import '../../models/Matches.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/User.dart';
import '../../Services/User.dart';
import 'FollowingListView.dart';
import 'Tempfollow.dart';

class FollowingOverview extends StatelessWidget {

  final User userid;
  FollowingOverview({this.userid});
  

  @override
  Widget build(BuildContext context) {
    if(userid.followingusers.map((f)=>f.ID).toList().isNotEmpty){

      return StreamProvider<List<User>>.value(
      value: UserService(user: userid.followingusers.map((f)=>f.ID).toList()).members,
      

      child: Scaffold(
        appBar: AppBar(
          title:Text('Following')         
        ),
        body: Container(
          child: FollowingUser(),
        ),
      ),
    );
     
    }else{
       var title ='Following';
      return Tempfollow(title:title);

    
    }
  }
}