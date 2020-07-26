//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Auth.dart';
import 'package:flutter_app/screens/invite/InviteOverView.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../main.dart';
import './lobby.dart' as lobby;
import './profile.dart' as profile;
import './myTeams.dart' as team;
import './myMatches.dart' as match;
import './help.dart' as help;


class HomePage extends StatelessWidget {
   int selectedPage;
  int matchpage;
  HomePage(this.selectedPage ,@optionalTypeArgs this.matchpage);

  @override
  Widget build(BuildContext context) {
    godetails(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MyApp()  ) );}
    final AuthService _auth = AuthService();

    return MaterialApp(
      theme: ThemeData(
    primaryColor: Colors.blue[800],
    accentColor: Colors.cyan,
      ),
      home: DefaultTabController(
        initialIndex:selectedPage ,
        length: 5,
        child: Scaffold(
          
          appBar: AppBar(
            
            title: const Text('Kick Off'),
             actions: <Widget>[
              
          FlatButton.icon(
            icon: Icon(FontAwesome.sign_out),
            label: Text('Logout' , style: TextStyle(color:Colors.white),),
            onPressed: () async{ await _auth.signOut();
            
            Future.delayed(Duration.zero, godetails());},)],

            bottom: TabBar(
              
              isScrollable: true,
                //controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.person),text: 'Profile'),
                  new Tab(icon: new Icon(Icons.public),text: 'Fields'),
                  new Tab(icon: new Icon(Icons.schedule),text: 'My Matches'),
                   new Tab(icon: new Icon(Icons.group),text: 'Team'),
                  new Tab(icon: new Icon(FontAwesome.inbox),text: 'Invitations'),
                ]
            ),
          ),
          body: TabBarView(
              //controller: controller,
              children: <Widget>[
                new profile.Profile(),
                new lobby.Lobby(),
                new match.Matches(matchpage??0),
                new team.Teams(),
                new inviteOverview(),
              ]
          ),
        ),
      ),
    );
  }
}




