import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import 'Match_item_Rate.dart';


class Matchview_Rate extends StatefulWidget {
  @override
  _Matchview_RateState createState() => _Matchview_RateState();
}

class _Matchview_RateState extends State<Matchview_Rate> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];
 
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
      
        return MatchItem_Rate(match: match[index]);
        
       
      },
    );
  }
}