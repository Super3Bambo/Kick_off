import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../models/Matches.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import '../../Services/User.dart';
import './Friends_Item.dart';


class MatchFriends extends StatefulWidget{
  final Match matchid;
  MatchFriends({this.matchid});

  @override
  _MatchFriendsState createState() => _MatchFriendsState();
}

class _MatchFriendsState extends State<MatchFriends> {
  @override
  Widget build(BuildContext context) {
  //List<User> user = matchid.users;

    
       final friends = Provider.of<List<User>>(context) ?? [];
          return ListView.builder( 
            itemCount: friends.length,
            itemBuilder: (context, index) {
              return FriendsItem(friends:friends[index] , match: widget.matchid,); /* Padding(
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