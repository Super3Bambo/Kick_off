import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import 'Match_item_Complete.dart';


class Matchview_Complete extends StatefulWidget {
  @override
  _Matchview_CompleteState createState() => _Matchview_CompleteState();
}

class _Matchview_CompleteState extends State<Matchview_Complete> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];
 
    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
      //  return ListTile();
      //for (int i = 0; i==index; i++) {
        
      
        return MatchItem_Complete(match: match[index]);
        
       
      },
    );
  }
}