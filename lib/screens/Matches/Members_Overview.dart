import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/team.dart';

import '../../models/Matches.dart';
import '../../Services/Match.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Matches_listview_User.dart';
import '../../models/User.dart';
import '../../Services/User.dart';
import 'Member_ListView.dart';

class MatchesOverview extends StatelessWidget {

  final Match matchid;
  MatchesOverview({this.matchid});
  

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Team>>.value(
      value: TeamService(teamid: matchid.team.map((f)=>f.ID).toList()).members,
      

      child: Scaffold(
        appBar: AppBar(
          title:Text('Match Members')         
        ),
        body: Container(
          child: MatchMember(),
        ),
      ),
    );
  }
}