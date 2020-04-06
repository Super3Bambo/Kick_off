import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import 'Match_item_History.dart';


class Matchview_History extends StatefulWidget {
  @override
  _Matchview_HistoryState createState() => _Matchview_HistoryState();
}

class _Matchview_HistoryState extends State<Matchview_History> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];
 
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
      //  return ListTile();
      //for (int i = 0; i==index; i++) {
        
      
        return MatchItem_History(match: match[index]);
        
       
      },
    );
  }
}