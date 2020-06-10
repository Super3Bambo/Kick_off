import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Team/TeamMember_OverView.dart';
import './FieldsChallengeOverview.dart';
import 'package:flutter_app/models/team.dart';
import '../League/League_OverView.dart';
import 'MatchChallengeOverView.dart';
import 'TeamsToJoinOverview.dart';
import 'createTeam.dart';


class JoinBoard extends StatelessWidget {
             static const routeName = '/createteam';

  @override
  Widget build(BuildContext context) {
    return   Container(
            child: DefaultTabController(
        length: 2,
        child: Scaffold(
           
                            body: TabBarView(                              
              //controller: controller,
                children: <Widget>[
                  new CreateTeam(),
                  new AllTeams(),
                 
                ],
                
              ),
            
         
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(left:80),
                            child: new TabBar(
                  isScrollable: true,
                  //controller: controller,
                  tabs: <Tab>[
                    new Tab(icon: new Icon(Icons.group_add),text: 'Create Your Team'),
                    new Tab(icon: new Icon(Icons.add_circle),text: 'Join To Team'),
                    
                  ],
                    indicatorSize: TabBarIndicatorSize.label,
                     indicatorPadding: EdgeInsets.all(5.0),
                      labelColor: Colors.blue[600],
                      indicatorColor: Colors.green,


              ),
              
            
          ),          
          backgroundColor: Colors.blue[50],
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          

        ),
          ),
      
    );
        
    
  }
}

