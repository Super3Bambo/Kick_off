import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import 'MatchChallengeItem.dart';


class MatchviewChallenge extends StatefulWidget {
  final Team teamid;
  MatchviewChallenge({this.teamid});
  @override
  _MatchviewChallengeState createState() => _MatchviewChallengeState();
}

class _MatchviewChallengeState extends State<MatchviewChallenge> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];

    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
        
        return MatchItemChallenge(match: match[index],team: widget.teamid,);
        
      },
    );
  }
}