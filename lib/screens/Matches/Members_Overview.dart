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
import 'NoMembers.dart';

class MatchesMemberOverview extends StatelessWidget {

  final Match matchid;
  MatchesMemberOverview({this.matchid});
  

  @override
  Widget build(BuildContext context) {

    if(matchid.users.isEmpty||matchid.users.length==0){

      return TempMembers(title: 'Members',);
    }
    
    else{
       return StreamProvider<List<User>>.value(
      value: UserService(user: matchid.users.map((f)=>f.ID).toList()).members,
      

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
}