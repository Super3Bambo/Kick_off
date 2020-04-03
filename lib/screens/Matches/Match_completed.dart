import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Matches/Match_Details.dart';
import 'package:flutter_app/screens/Matches/Match_item.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import './Match_item_progress.dart';


class MatchCompleted extends StatefulWidget {
  @override
  _MatchCompletedState createState() => _MatchCompletedState();
  final Match matchid;

  MatchCompleted({this.matchid}); 
}

class _MatchCompletedState extends State<MatchCompleted> {
  DateTime now=DateTime.now();
int diff;
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];
DateTime finish= new Text(widget.matchid.Check_out.toString()) as DateTime;

    diff=finish.difference(now).inSeconds;

    return ListView.builder(
    

      itemCount: match.length,
      itemBuilder: (context, index) {
        if( match[index].users.length==10&&diff>0){
        return MatchItem(match: match[index]);
        }

      },
    );
  }
}