import '../../models/Matches.dart';
import '../../Services/Match.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Matches_listview.dart';

class MatchesOverview extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Match>>.value(
      value: MatchService().matcheses,
      

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
          child: Matchview(),
        ),
      ),
    );
  }
}