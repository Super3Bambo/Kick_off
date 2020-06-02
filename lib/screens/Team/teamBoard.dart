import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Team/TeamMember_OverView.dart';
import './teamMembers.dart' as teamMembers;
import '../Home/League.dart' as leagues;
import './FieldsChallengeOverview.dart';
import 'package:flutter_app/models/team.dart';
import '../League/League_OverView.dart';
import 'MatchChallengeOverView.dart';


class TeamBoard extends StatelessWidget {
final Team team;

  TeamBoard({this.team});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Kick Off'),
            bottom: TabBar(
                isScrollable: true,
                //controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.group),text: 'Members'),
                  new Tab(icon: new Icon(Icons.supervised_user_circle),text: 'My Matches'),
                  new Tab(icon: new Icon(Icons.access_time),text: 'Fields'),
                  new Tab(icon: new Icon(Icons.stars),text: 'Leagues'),

                ]
            ),
          ),
          body: TabBarView(
            //controller: controller,
              children: <Widget>[
                new Members_OverView(teamid: team),
                new MatchesOverviewChallenge(teamid: team),
                new FieldsChallengeOverview(teamid: team),
                new LeagueOverviewProgress(teamid: team),
              ]
            ),
          ),
        ),
    );
  }
}

