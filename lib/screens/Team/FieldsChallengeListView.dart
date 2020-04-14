import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'package:provider/provider.dart';
import '../../models/field.dart';
import 'FieldsChallenge_Item.dart';
class FieldChallengeview extends StatefulWidget {
  
  final Team teamid;
  FieldChallengeview({this.teamid});
  @override
  _FieldChallengeviewState createState() => _FieldChallengeviewState();
}

class _FieldChallengeviewState extends State<FieldChallengeview> {
  @override
  Widget build(BuildContext context) {

    final field = Provider.of<List<Field>>(context) ?? [];

    return ListView.builder(
      itemCount: field.length,
      itemBuilder: (context, index) {
        return FieldChallengeItem(fields: field[index],teamid:widget.teamid);
      },
    );
  }
}