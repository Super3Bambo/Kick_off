import 'package:flutter/material.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/screens/OwnerDashBoard/Field/Field_Item.dart';
import 'package:provider/provider.dart';

import 'test3.dart';
class eee extends StatefulWidget {
  @override
  _eeeState createState() => _eeeState();
}

class _eeeState extends State<eee> {
  @override
  Widget build(BuildContext context) {

    final field = Provider.of<List<Match>>(context) ?? [];

    return ListView.builder(
      itemCount: field.length,
      itemBuilder: (context, index) {
        return fff(field: field[index]);
      },
    );
  }
}