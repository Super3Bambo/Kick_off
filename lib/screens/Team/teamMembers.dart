import './Tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';

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
    return ListView.builder(
      itemCount: widget.team.users.length,
      itemBuilder: (context, index){
        return Test(team: widget.team)  ;
      });
  }
}