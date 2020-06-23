import 'package:flutter/material.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';

import 'MatchChallengeItemteam.dart';


class MatchviewChallengeteam extends StatefulWidget {
  final Team teamid;
  MatchviewChallengeteam({this.teamid});
  @override
  _MatchviewChallengeteamState createState() => _MatchviewChallengeteamState();
}

class _MatchviewChallengeteamState extends State<MatchviewChallengeteam> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];

    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
        
        return MatchItemChallengeteam(match: match[index],team: widget.teamid,);
        
      },
    );
  }
}