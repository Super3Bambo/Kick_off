import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/field.dart';
import './FieldList.dart';
class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final field = Provider.of<List<Field>>(context) ?? [];

    return ListView.builder(
      itemCount: field.length,
      itemBuilder: (context, index) {
        return FieldList(fields: field[index]);
      },
    );
  }
}