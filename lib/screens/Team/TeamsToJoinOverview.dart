import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/team.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TeamsToJoinListView.dart';

class AllTeams extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Team>>.value(
      value: TeamService().teamstojoin,
      

      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: AllTeamsList(),
        ),
      ),
    );
  }
}