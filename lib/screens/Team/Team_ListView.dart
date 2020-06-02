import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Team/test.dart';
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
       
        return test(team: team[index]);
        
      },
    );
  }
}