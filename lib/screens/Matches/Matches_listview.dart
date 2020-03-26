import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import 'Match_item.dart';
import './Match_item_progress.dart';


class Matchview extends StatefulWidget {
  @override
  _MatchviewState createState() => _MatchviewState();
}

class _MatchviewState extends State<Matchview> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];

    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
        if( match[index].users.length==10){
        return MatchItem(match: match[index]);
        }
      },
    );
  }
}