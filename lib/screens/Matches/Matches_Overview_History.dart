import '../../models/Matches.dart';
import '../../Services/Match.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Matches_listview_History.dart';
import '../../models/User.dart';

class MatchesOverview_History extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamProvider<List<Match>>.value(
      value: MatchService(userid:user.ID ).historymatches,
      

      child: Scaffold(
        appBar: AppBar(
          title: Text('Matches'),
         
        ),
        body: Container(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Matchview_History(),
        ),
      ),
    );
  }
}