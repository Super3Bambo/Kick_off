import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import '../../models/team.dart';
import 'package:flutter_app/screens/Team/Team_ListView.dart';
import 'package:provider/provider.dart';
import '../../Services/Team.dart';

class Teams_OverView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
           User user = Provider.of<User>(context);

    return StreamProvider<List<Team>>.value(
      value: TeamService(userid: user.ID).teamz,
      
         child: Scaffold(
        appBar: AppBar(
          title: Text('Teams'),
         
        ),
        
          body: TeamView(),
        
      ),
        
      
    );
    }
    }