import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/User/FollowersItem.dart';
import '../../models/Matches.dart';
import '../../Services/Match.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import '../../Services/User.dart';
import 'FollowingItem.dart';


class FollowersUser extends StatefulWidget{
  final Match userid;
  FollowersUser({this.userid});

  @override
  _FollowersUserState createState() => _FollowersUserState();
}

class _FollowersUserState extends State<FollowersUser> {
  @override
  Widget build(BuildContext context) {
  //List<User> user = matchid.users;

    
       final followers = Provider.of<List<User>>(context) ?? [];
          return ListView.builder( 
            itemCount: followers.length,
            itemBuilder: (context, index) {
              return FollowersItem(followers:followers[index]); /* Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          //onTap: () => godetails(fields), 
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
          title: Text(widget.matchid.users[index].ID),
          //subtitle: Text(),
        ),
      ),
    );
            }
        ),)*/
            });
  }
}