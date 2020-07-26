import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/Team/MatchesBoard.dart';
import 'package:flutter_app/screens/Team/TeamMember_OverView.dart';
import 'package:provider/provider.dart';
import './FieldsChallengeOverview.dart';
import 'package:flutter_app/models/team.dart';
import '../League/League_OverView.dart';
import 'MatchChallengeOverView.dart';
import 'Requests/Premission.dart';
import 'Requests/RequestOverview.dart';


class TeamBoard extends StatelessWidget {
final Team team;

  TeamBoard({this.team});

  @override
  Widget build(BuildContext context) {
User user = Provider.of<User>(context);


    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title:  Text(team.Name.toString()),
            bottom: TabBar(
                isScrollable: true,
                //controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.group),text: 'Members'),
                  new Tab(icon: new Icon(Icons.supervised_user_circle),text: 'My Matches'),
                  new Tab(icon: new Icon(Icons.access_time),text: 'Fields'),
                  new Tab(icon: new Icon(Icons.stars),text: 'Leagues'),
                  new Tab(icon: new Icon(Icons.add_circle),text: 'Requests'),
                  

                ]
            ),
          ),
          body: TabBarView(
            //controller: controller,
              children: <Widget>[
                new Members_OverView(teamid: team),
                new MatchesTeam(teamid: team),
                new FieldsChallengeOverview(teamid: team),
                new LeagueOverviewProgress(teamid: team),
                team.Owner==user.ID? RequestsOverview(teamid: team.ID,):Premission(),
                              ]
                            ),
                          ),
                        ),
                    );
                  }
                }
                
               

