import 'package:flutter/material.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/Team/test.dart';
import '../../models/team.dart';
import 'package:flutter_app/screens/Team/Team_ListView.dart';
import 'package:provider/provider.dart';
import '../../Services/Team.dart';
import 'Team_item.dart';

class Teams_OverView extends StatelessWidget{
  bool loading =false;
  @override
  Widget build(BuildContext context) {
          /* User user = Provider.of<User>(context);
           return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userData = snapshot.data;

    return  loading?Loading():StreamProvider<Team>.value(
      value: TeamService(userid: userData.TeamID).teamone,
      
         child: Scaffold(
             backgroundColor: Color.fromRGBO(34, 149, 162, 150),
       
        
          body: TeamItem(),
        
      ),
        
      
    );
    }else{return Loading();}
    });*/
 User user = Provider.of<User>(context);
return StreamProvider<List<Team>>.value(
      value: TeamService(userid:user.ID ).teamz,
        
          child: TeamView (),
        );
    }}