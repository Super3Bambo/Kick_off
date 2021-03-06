/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/FieldsProvider.dart';
import './Field_Item.dart';



class Fieldview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

final fieldsData = Provider.of<Fields>(context);
    final fields = fieldsData.fields;
return Scaffold(
  appBar: AppBar(
    title: Text('Fields'),
  ),
body: ListView.builder(
      padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
          itemCount:fields.length ,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: fields[index],
          // builder: (c)=> fields[index],
            child: FieldItem(),      
          ),),
          );
  }
  }*/

import 'package:flutter/material.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/screens/OwnerDashBoard/Field/Field_Item.dart';
import 'package:provider/provider.dart';
class Fieldview extends StatefulWidget {
  @override
  _FieldviewState createState() => _FieldviewState();
}

class _FieldviewState extends State<Fieldview> {
  @override
  Widget build(BuildContext context) {

    final field = Provider.of<List<Field>>(context) ?? [];

    return ListView.builder(
      itemCount: field.length,
      itemBuilder: (context, index) {
        return FieldItemowner(field: field[index]);
      },
    );
  }
}