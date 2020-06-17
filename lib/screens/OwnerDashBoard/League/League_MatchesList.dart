import 'package:flutter/material.dart';
import 'package:flutter_app/models/LeagueMatches.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/screens/OwnerDashBoard/League/LeagueMatchesItem.dart';
import 'package:provider/provider.dart';

class LeagueMatchList extends StatefulWidget {
  @override
  _LeagueMatchListState createState() => _LeagueMatchListState();
}

class _LeagueMatchListState extends State<LeagueMatchList> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<LeagueMatch>>(context) ?? [];

    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
        return MatchLeagueItem(match: match[index],);
      },
    );
  }
}