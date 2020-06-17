import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/OwnerDashBoard/League/Add_League/Fields_Iistview.dart';
import 'package:provider/provider.dart';

class FieldsOverviewownerleague extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

     User user = Provider.of<User>(context);

    return StreamProvider<List<Field>>.value(
      value: FieldService(ownerid: user.ID).fieldsowner,
        child: Scaffold(
          appBar: AppBar(title:Text('Select Field To Add League')),
                  body: Container(
          /*  decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/5omasy.jpg'),
                fit: BoxFit.cover,
              ),
            ),*/
            child: Fieldview()
          ),
        ),
    );
  }
}