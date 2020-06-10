import 'package:flutter_app/models/User.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'Members_Item.dart';
import 'TeamMemberItemshape.dart';

class TeamMembers extends StatefulWidget{
  final Team team;

  TeamMembers({this.team});

  @override
  _TeamMembersState createState() => _TeamMembersState();
}

class _TeamMembersState extends State<TeamMembers> {
  @override
  Widget build(BuildContext context) {
    /*return Scaffold (
        body: Row(
          children: <Widget>[
            Expanded(
              child: Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                  },
                  child: Container(
                    padding: const EdgeInsets.all(36.0),
                    width: 300,
                    height: 100,
                    child: Text(//widget.team.Name,
                    widget.team.Name,
                      style: TextStyle(fontSize: 20.0),),
                  ),
                ),
              ),
            ),
          ],
        )
    );*/
    final members = Provider.of<List<User>>(context) ?? [];
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index){
        return TeamMemberItemshape(members: members[index])  ;
      });
  }
}