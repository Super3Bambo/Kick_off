import 'package:flutter/material.dart';
import 'package:flutter_app/models/LeagueMatches.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';

import 'AllMatchesofLeagueItem.dart';


class AllMatchesLeagueList extends StatefulWidget {
  final Team teamid;
  AllMatchesLeagueList({this.teamid});
  @override
  _AllMatchesLeagueListState createState() => _AllMatchesLeagueListState();
}

class _AllMatchesLeagueListState extends State<AllMatchesLeagueList> {
  @override
  Widget build(BuildContext context) {

    final teamleaguematch = Provider.of<List<LeagueMatch>>(context) ?? [];

    return ListView.builder(
      itemCount: teamleaguematch.length,
      itemBuilder: (context, index) {
        
        return  AllMatchLeagueItem(match: teamleaguematch[index],teamid: widget.teamid, index:index);
        
      },
    );
  }
}