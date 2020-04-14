import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/Team/teamMembers.dart';
import '../../models/team.dart';
import 'package:flutter_app/screens/Team/Team_ListView.dart';
import 'package:provider/provider.dart';
import '../../Services/User.dart';

class Members_OverView extends StatelessWidget{
 final Team teamid;
  Members_OverView({this.teamid});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<User>>.value(
      value: UserService(usrteam: teamid.users.map((e) => e.ID).toList()).teammember,
      
         
        
          child: TeamMembers(),
        
      
        
      
    );
    }
    }