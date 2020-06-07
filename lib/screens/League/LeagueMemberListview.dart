import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/team.dart';
import '../../models/Matches.dart';
import '../../Services/Match.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import '../../Services/User.dart';
import 'LeaguememberItem.dart';


class Leaguememberview extends StatefulWidget{

  @override
  _LeaguememberviewState createState() => _LeaguememberviewState();
}

class _LeaguememberviewState extends State<Leaguememberview> {
  @override
  Widget build(BuildContext context) {
  //List<User> user = matchid.users;

    
       final teams = Provider.of<List<Team>>(context) ?? [];
          return ListView.builder( 
            itemCount: teams.length,
            itemBuilder: (context, index) {
              return LeagueMemberItem(teamsid:teams[index]); /* Padding(
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