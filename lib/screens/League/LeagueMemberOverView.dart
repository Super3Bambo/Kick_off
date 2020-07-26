import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/League/nomember.dart';
import 'package:flutter_app/screens/User/Tempfollow.dart';

import '../../models/Matches.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/User.dart';
import '../../Services/User.dart';
import 'LeagueMemberListview.dart';

class LeaguememberOverview extends StatelessWidget {

  final List<String> leagueid;
  LeaguememberOverview({this.leagueid});
  

  @override
  Widget build(BuildContext context) {
    if(leagueid.isEmpty){
      return NOMEMBER(content: 'NO Members yet', title: 'MEMBERS',);
    }else{

    return StreamProvider<List<Team>>.value(
      value: TeamService(leagueid: leagueid).members,
      

      child: Scaffold(
        appBar: AppBar(
          title:Text('League Member')         
        ),
        body: Container(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Leaguememberview(),
        ),
      ),
    );
  }}
}