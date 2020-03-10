import 'package:flutter/material.dart';
import '../../models/field.dart';


class FieldList extends StatelessWidget {

  final Field fields;
  FieldList({ this.fields });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
       //   onTap: {Navigator.},
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
          title: Text(fields.Location),
          subtitle: Text(fields.Name),
        ),
      ),
    );
  }
}
