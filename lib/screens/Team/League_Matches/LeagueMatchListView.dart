import 'package:flutter/material.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';

import 'League_Match_Item.dart';


class LeagueforMatchListview extends StatefulWidget {
  final Team teamid;
  LeagueforMatchListview({this.teamid});
  @override
  _LeagueforMatchListviewState createState() => _LeagueforMatchListviewState();
}

class _LeagueforMatchListviewState extends State<LeagueforMatchListview> {
  @override
  Widget build(BuildContext context) {

    final leaguematch = Provider.of<List<League>>(context) ?? [];

    return ListView.builder(
      itemCount: leaguematch.length,
      itemBuilder: (context, index) {
        
        return LeagueMatchItem (league: leaguematch[index],teamid: widget.teamid,);
        
      },
    );
  }
}