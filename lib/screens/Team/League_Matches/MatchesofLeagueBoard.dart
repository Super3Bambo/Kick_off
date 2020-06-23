import 'package:flutter/material.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Team/MatchChallengeOverView.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'AllMatchesofLeagueOverview.dart';
import 'TeamMatchesofLeagueOverview.dart';

class LeagueMatchesTeam extends StatelessWidget
 
{      final Team teamid;
   final League leagueid; 

  LeagueMatchesTeam({this.teamid , this.leagueid});     

  @override
  Widget build(BuildContext context) {

    return  Container(
            child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(title:Text('League Matches')),
           
                            body: TabBarView(                              
                children: <Widget>[
                  new TeamMatchesLeague(teamid:teamid ,leagueid: leagueid,),
                  new AllMatchesLeague(teamid: teamid,leagueid: leagueid,),
                  
                 
                ],
                
              ),
            
         
            bottomNavigationBar: Container(
             // margin: EdgeInsets.only(left:80),
                            child: new TabBar(
                  isScrollable: false,
                  
                  //controller: controller,
                  tabs: <Tab>[
                    new Tab(icon: new Icon(FontAwesome.font_awesome, size: 20,),text: 'My Matches' ,),
                    new Tab(icon: new Icon(Ionicons.ios_football),text:'All matches'  ),
                   
                    
                  ],
                    indicatorSize: TabBarIndicatorSize.tab,
                     indicatorPadding: EdgeInsets.all(5.0),
                     
                      labelColor: Colors.black,
                      indicatorColor: Colors.black87,
                      labelStyle: TextStyle(fontSize: 12 ,),


              ),
              
            
          ),          
          backgroundColor: Colors.grey[200],
          resizeToAvoidBottomPadding: false,
          resizeToAvoidBottomInset: false,
          

        ),
          ),
      
    );
        
    
  }
}