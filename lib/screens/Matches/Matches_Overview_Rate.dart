import '../../models/Matches.dart';
import '../../Services/Match.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/User.dart';
import 'Matches_listview_Rate.dart';

class MatchesOverview_Rate extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamProvider<List<Match>>.value(
      value: MatchService(userid:user.ID ).historymatchesevaluted,
      

      child: Container(
      
          child: Matchview_Rate(),
        ),
      
    );
  }
}