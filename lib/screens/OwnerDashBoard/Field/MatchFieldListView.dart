import 'package:flutter/material.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/screens/OwnerDashBoard/Field/Field_Item.dart';
import 'package:provider/provider.dart';

import 'MatchFieldItem.dart';
class MatchFieldListView extends StatefulWidget {
  @override
  _MatchFieldListViewState createState() => _MatchFieldListViewState();
}

class _MatchFieldListViewState extends State<MatchFieldListView> {
  @override
  Widget build(BuildContext context) {

    final match = Provider.of<List<Match>>(context) ?? [];

    return ListView.builder(
      itemCount: match.length,
      itemBuilder: (context, index) {
        return MatchFieldItem(match: match[index]);
      },
    );
  }
}