import 'package:flutter_app/Services/League.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LeagueMatchListView.dart';


class LeagueforMatch extends StatelessWidget {

   final Team teamid;
  LeagueforMatch({this.teamid});

  @override
  Widget build(BuildContext context) {



    return StreamProvider<List<League>>.value(
      value: LeagueService(teamid: teamid.ID).leaguesteam,
      
child: Scaffold(
        
        body: Container(
     
          child:LeagueforMatchListview (teamid: teamid,),
        ),)
      
    );
  }
}