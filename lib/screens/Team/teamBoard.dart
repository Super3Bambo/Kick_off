import 'package:flutter/material.dart';
import './teamMembers.dart' as teamMembers;
import '../Home/League.dart' as leagues;
import './teamMatches.dart' as teamMatches;

class TeamBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Kick Off'),
            bottom: TabBar(
                isScrollable: true,
                //controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.group),text: 'Members'),
                  new Tab(icon: new Icon(Icons.access_time),text: 'Matches'),
                  new Tab(icon: new Icon(Icons.stars),text: 'Leagues'),
                ]
            ),
          ),
          body: TabBarView(
            //controller: controller,
              children: <Widget>[
                new teamMembers.teamMembers(),
                new teamMatches.teamMatches(),
                new leagues.League(),
              ]
            ),
          ),
        ),
    );
  }
}

