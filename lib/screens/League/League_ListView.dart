import 'package:flutter/material.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';

import 'League_Item.dart';

class LeagueviewProgress extends StatefulWidget {

  final Team teamid;
  LeagueviewProgress({this.teamid});
  @override
  _LeagueviewProgressState createState() => _LeagueviewProgressState();
}

class _LeagueviewProgressState extends State<LeagueviewProgress> {
  @override
  Widget build(BuildContext context) {

    final league = Provider.of<List<League>>(context) ?? [];

    return ListView.builder(
      itemCount: league.length,
      itemBuilder: (context, index) {
       
        return LeagueItem(league: league[index],teamid:widget.teamid);
        
      },
    );
  }
}