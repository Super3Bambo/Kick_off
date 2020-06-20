import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Invations.dart';
import 'package:flutter_app/models/Invite.dart';
import 'package:flutter_app/models/User.dart';
import 'package:provider/provider.dart';

import 'InviteItem.dart';

class InviteList extends StatefulWidget{
  
  @override
  _InviteListState createState() => _InviteListState();
}

class _InviteListState extends State<InviteList> {
  @override
  Widget build(BuildContext context) {
  //List<User> user = matchid.users;

    
       final invite = Provider.of<List<Invite>>(context) ?? [];
          return ListView.builder( 
            itemCount: invite.length,
            itemBuilder: (context, index) {
              return inviteItem(invite: invite[index],); /* Padding(
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