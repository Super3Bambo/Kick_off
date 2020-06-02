import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';

import '../../Services/League.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

import 'League_ListView.dart';

class LeagueOverviewProgress extends StatelessWidget {

  final Team teamid;
  LeagueOverviewProgress({this.teamid});

  @override
  Widget build(BuildContext context) {



    return StreamProvider<List<League>>.value(
      value: LeagueService().leagues,
        
          child: LeagueviewProgress(teamid:teamid),
        );
  }
}