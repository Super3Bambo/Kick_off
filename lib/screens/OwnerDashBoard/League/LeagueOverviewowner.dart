import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/League.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/screens/OwnerDashBoard/Field/Fields_Iistview.dart';
import 'package:flutter_app/screens/OwnerDashBoard/League/LeagueListView.dart';
import 'package:provider/provider.dart';

class LeagueOverviewowner extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamProvider<List<League>>.value(
      value: LeagueService(ownerid: user.ID).leaguesowner,
      child: Container(
        /*  decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Leagueview()
      ),
    );
  }
}