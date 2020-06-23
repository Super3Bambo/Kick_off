import 'package:flutter/material.dart';
import 'package:flutter_app/models/LeagueMatches.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';

import 'League_Match_Item.dart';
import 'TeamMatchesofLeagueItem.dart';


class TeamMatchesLeagueList extends StatefulWidget {
  final Team teamid;
  TeamMatchesLeagueList({this.teamid});
  @override
  _TeamMatchesLeagueListState createState() => _TeamMatchesLeagueListState();
}

class _TeamMatchesLeagueListState extends State<TeamMatchesLeagueList> {
  @override
  Widget build(BuildContext context) {

    final teamleaguematch = Provider.of<List<LeagueMatch>>(context) ?? [];

    return ListView.builder(
      itemCount: teamleaguematch.length,
      itemBuilder: (context, index) {
        
        return  TeamMatchLeagueItem(match: teamleaguematch[index],teamid: widget.teamid, index:index);
        
      },
    );
  }
}