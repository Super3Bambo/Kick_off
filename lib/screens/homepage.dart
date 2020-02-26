import 'dart:ui';

import 'package:flutter/material.dart';
import './lobby.dart' as lobby;
import './profile.dart' as profile;
import './myTeams.dart' as team;
import './myMatches.dart' as match;
import './help.dart' as help;
import 'package:firebase_auth/firebase_auth.dart';
 abstract class IRegister extends StatefulWidget{
  final _auth= FirebaseAuth.instance;
  FirebaseUser loggedInUser;

void initState(){
  initState();
  getCurrentUser();
}
void getCurrentUser()async{
  try{
    final user =await _auth.currentUser();
    if (user!=null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }
  catch(e){
    print(e);

  }
}}
class TabbedAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {




    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('E7gzly'),
            bottom: TabBar(
              isScrollable: true,
                //controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.public),text: 'Lobby'),
                  new Tab(icon: new Icon(Icons.person),text: 'Profile'),
                  new Tab(icon: new Icon(Icons.group),text: 'My Teams'),
                  new Tab(icon: new Icon(Icons.schedule),text: 'My Matches'),
                  new Tab(icon: new Icon(Icons.help),text: 'Help'),
                ]
            ),
          ),
          body: TabBarView(
              //controller: controller,
              children: <Widget>[
                new lobby.Lobby(),
                new profile.Profile(),
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

