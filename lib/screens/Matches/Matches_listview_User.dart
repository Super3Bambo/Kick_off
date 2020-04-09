import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import 'Match_item_User.dart';
import './Match_item_progress.dart';


class Matchview extends StatefulWidget {
  @override
  _MatchviewState createState() => _MatchviewState();
}

class _MatchviewState extends State<Matchview> {
  @override

  Future<Null> getrefresh()async{
    await Future.delayed(Duration(seconds:1));
  }
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];
 
     return RefreshIndicator(
            onRefresh: getrefresh,
          child: ListView.builder(
        itemCount: match.length,
        itemBuilder: (context, index) {
        
          
        
          return MatchItem(match: match[index]);
          
         
        },
      ),
    );
  }
}