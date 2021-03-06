import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/OwnerDashBoard/Field/Fields_Iistview.dart';
import 'package:provider/provider.dart';

import 'MatchFieldListView.dart';

class MatchFieldOverview extends StatelessWidget {

  String field;

MatchFieldOverview({this.field});
  @override
  Widget build(BuildContext context) {

     User user = Provider.of<User>(context);

    return StreamProvider<List<Match>>.value(
      value: MatchService(fieldid: field).matchowner,
        child: Scaffold(
          appBar: AppBar(title:Text('Matches')),
                  body: Container(
          /*  decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/5omasy.jpg'),
                fit: BoxFit.cover,
              ),
            ),*/
            child: MatchFieldListView()
          ),
        ),
    );
  }
}