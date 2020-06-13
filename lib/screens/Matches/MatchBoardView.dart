import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Matches/MatchBoardItem.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import './Match_item_progress.dart';


class MatchBoardView extends StatefulWidget {
  @override
  _MatchBoardViewState createState() => _MatchBoardViewState();
}

class _MatchBoardViewState extends State<MatchBoardView> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];

    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {

        return MatchBoardItem(match: match[index]);

      },
    );
  }
}