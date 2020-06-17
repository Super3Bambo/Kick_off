import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';
import 'LeaguememberItem.dart';


class Leaguememberviewowner extends StatefulWidget{

  @override
  _LeaguememberviewownerState createState() => _LeaguememberviewownerState();
}

class _LeaguememberviewownerState extends State<Leaguememberviewowner> {
  @override
  Widget build(BuildContext context) {
  //List<User> user = matchid.users;

    
       final teams = Provider.of<List<Team>>(context) ?? [];
          return ListView.builder( 
            itemCount: teams.length,
            itemBuilder: (context, index) {
              return LeagueMemberItemowner(teamsid:teams[index]); /* Padding(
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