import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LeagueMemberListview.dart';

class LeaguememberOverviewowner extends StatelessWidget {

  final List<String> leagueid;
  LeaguememberOverviewowner({this.leagueid});
  

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Team>>.value(
      value: TeamService(leagueid: leagueid).members,
      

      child: Scaffold(
        appBar: AppBar(
          title:Text('Members')         
        ),
        body: Container(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Leaguememberviewowner(),
        ),
      ),
    );
  }
}