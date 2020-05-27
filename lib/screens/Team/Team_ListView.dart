import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';
import 'Team_item.dart' ;


class TeamView extends StatefulWidget {
  @override
  _TeamViewState createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  @override
  Widget build(BuildContext context) {

    final team = Provider.of<List<Team>>(context) ?? [];

    return ListView.builder(
      itemCount: team.length,
      itemBuilder: (context, index) {
       
        //return TeamItem(team: team[index]);
        
      },
    );
  }
}