import '../../models/Matches.dart';
import '../../Services/Match.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Matches_listview_User.dart';
import '../../models/User.dart';
import '../../Services/User.dart';
import 'Member_ListView.dart';

class MatchesOverview extends StatelessWidget {

  final Match matchid;
  MatchesOverview({this.matchid});
  

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<User>>.value(
      value: UserService(user: matchid.users.map((f)=>f.ID).toList()).members,
      

      child: Scaffold(
        appBar: AppBar(
          title:Text('Match Members')         
        ),
        body: Container(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: MatchMember(),
        ),
      ),
    );
  }
}