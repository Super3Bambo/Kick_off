import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MatchChallengeListViewteam.dart';

class MatchesOverviewChallengeteam extends StatelessWidget {

   final Team teamid;
  MatchesOverviewChallengeteam({this.teamid});

  @override
  Widget build(BuildContext context) {



    return StreamProvider<List<Match>>.value(
      value: MatchService(teamid: teamid.ID).allchallengeteam,
      
child: Scaffold(
        
        body: Container(
     
          child: MatchviewChallengeteam(teamid: teamid,),
        ),)
      
    );
  }
}