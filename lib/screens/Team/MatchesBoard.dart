import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Team/MatchChallengeOverView.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'League_Matches/LeagueMatchOverview.dart';
import 'MatchChallengeOverViewteam.dart';

class MatchesTeam extends StatelessWidget
 
{      final Team teamid;
  MatchesTeam({this.teamid});     

  @override
  Widget build(BuildContext context) {

    return  Container(
            child: DefaultTabController(
        length: 3,
        child: Scaffold(
           
                            body: TabBarView(                              
                children: <Widget>[
                  new MatchesOverviewChallenge(teamid:teamid ,),
                  new MatchesOverviewChallengeteam(teamid: teamid,),
                  new LeagueforMatch(teamid: teamid,),
                  
                 
                ],
                
              ),
            
         
            bottomNavigationBar: Container(
             // margin: EdgeInsets.only(left:80),
                            child: new TabBar(
                  isScrollable: false,
                  
                  //controller: controller,
                  tabs: <Tab>[
                    new Tab(icon: new Icon(FontAwesome.font_awesome, size: 20,),text: 'Matches' ,),
                    new Tab(icon: new Icon(Ionicons.ios_football),text:'my matches'  ),
                    new Tab(icon: new Icon(Icons.add_box,),text:'League matches  ' , ),
                   
                    
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