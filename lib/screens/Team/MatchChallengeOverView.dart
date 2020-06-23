import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import '../../models/Matches.dart';
import '../../Services/Match.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MatchChallengeListView.dart';

class MatchesOverviewChallenge extends StatelessWidget {

   final Team teamid;
  MatchesOverviewChallenge({this.teamid});

  @override
  Widget build(BuildContext context) {



    return StreamProvider<List<Match>>.value(
      value: MatchService().allchallenges,
      
child: Scaffold(
        
        body: Container(
     
          child: MatchviewChallenge(teamid: teamid,),
        ),)
      
    );
  }
}