import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import './Match_item_progress.dart';


class MatchviewProgress extends StatefulWidget {
  @override
  _MatchviewProgressState createState() => _MatchviewProgressState();
}

class _MatchviewProgressState extends State<MatchviewProgress> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];

    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
        if( /* match[index].users.length>0  && match[index].users.length<10*/ match[index].users.length!=10){
        return MatchItemProgress(match: match[index]);
        }
      },
    );
  }
}