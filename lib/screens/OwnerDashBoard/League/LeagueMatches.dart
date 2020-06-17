import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/League.dart';
import 'package:flutter_app/models/LeagueMatches.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/OwnerDashBoard/League/Add_League/Fields_Iistview.dart';
import 'package:provider/provider.dart';

import 'League_MatchesList.dart';

class LeagueMatchesOverview extends StatelessWidget {

String leagueid;
LeagueMatchesOverview({this.leagueid});
  

  @override
  Widget build(BuildContext context) {

     User user = Provider.of<User>(context);

    return StreamProvider<List<LeagueMatch>>.value(
      value: LeagueService(leagueid:leagueid).leagueMatches,
        child: Scaffold(
          appBar: AppBar(title:Text('Select Field To Add League')),
                  body: Container(
          /*  decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/5omasy.jpg'),
                fit: BoxFit.cover,
              ),
            ),*/
            child: LeagueMatchList()
          ),
        ),
    );
  }
}