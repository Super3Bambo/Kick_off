//import 'dart:ui';

import 'package:flutter/material.dart';
import './lobby.dart' as lobby;
import './profile.dart' as profile;
import './myTeams.dart' as team;
import './myMatches.dart' as match;
import './help.dart' as help;


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Kick Off'),
            bottom: TabBar(
              isScrollable: true,
                //controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.person),text: 'Profile'),
                  new Tab(icon: new Icon(Icons.public),text: 'Lobby'),
                  new Tab(icon: new Icon(Icons.group),text: 'My Teams'),
                  new Tab(icon: new Icon(Icons.schedule),text: 'My Matches'),
                  new Tab(icon: new Icon(Icons.help),text: 'Help'),
                ]
            ),
          ),
          body: TabBarView(
              //controller: controller,
              children: <Widget>[
                new profile.Profile(),
                new lobby.Lobby(),
                new team.Teams(),
                new match.Matches(),
                new help.Help(),
              ]
          ),
        ),
      ),
    );
  }
}




