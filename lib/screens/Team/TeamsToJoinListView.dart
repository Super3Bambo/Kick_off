import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import 'TeamsToJoinItem.dart';


class AllTeamsList extends StatefulWidget {
  @override
  _AllTeamsListState createState() => _AllTeamsListState();
}

class _AllTeamsListState extends State<AllTeamsList> {
  @override
  Widget build(BuildContext context) {

    final teams = Provider.of<List<Team>>(context) ?? [];

    return ListView.builder(
      itemCount: teams.length,
      itemBuilder: (context, index) {
       
        return AllTeamsItem(teams: teams[index]);
        
      },
    );
  }
}