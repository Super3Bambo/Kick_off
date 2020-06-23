import 'package:flutter_app/Services/League.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/models/LeagueMatches.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AllMatchesofLeagueList.dart';


class AllMatchesLeague extends StatelessWidget {

   final Team teamid;
   final League leagueid; 
  AllMatchesLeague({this.teamid , this.leagueid});

  @override
  Widget build(BuildContext context) {



    return StreamProvider<List<LeagueMatch>>.value(
      value: LeagueService(teamid: teamid.ID , leagueid: leagueid.ID).leagueMYMatch,
      
child: Scaffold(
        
        body: Container(
     
          child:AllMatchesLeagueList (teamid: teamid,),
        ),)
      
    );
  }
}