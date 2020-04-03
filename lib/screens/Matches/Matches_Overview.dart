import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Matches/Match_item.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import './Match_item_progress.dart';


class MatchesOverview extends StatefulWidget {
  @override
  _MatchesOverviewState createState() => _MatchesOverviewState();
   final Match matchid;

  MatchesOverview({this.matchid}); 
}

class _MatchesOverviewState extends State<MatchesOverview> {
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
        if(  diff<0){
        return MatchItem(match: match[index]);
        }

      },
    );
  }
}