import 'package:flutter_app/models/team.dart';
import '../../models/field.dart';
import '../../Services/Fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FieldsChallengeListView.dart';

class FieldsChallengeOverview extends StatelessWidget {

  final Team teamid;
  FieldsChallengeOverview({this.teamid});

  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Field>>.value(
      value: FieldService().fieldses,
    
      
          child: FieldChallengeview(teamid:teamid)
        
      );
  }
}