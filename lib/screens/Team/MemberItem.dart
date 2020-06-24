import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Home/homepage.dart';
import 'package:provider/provider.dart';

class MembersItem extends StatelessWidget {


  final Team members;
  MembersItem({ this.members });

  
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(    
         
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(members.Name),
         subtitle: Text(members.NO_team),
      ),
    )
    );

  }
}
