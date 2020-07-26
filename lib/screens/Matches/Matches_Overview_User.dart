import 'package:flutter_app/Shared/Loading.dart';

import '../../models/Matches.dart';
import '../../Services/Match.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Matches_listview_User.dart';
import '../../models/User.dart';

class MatchesOverview extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);
    if(user.ID==null){
      return Loading();
    }
    else{

    return StreamProvider<List<Match>>.value(
      value: MatchService(userid:user.ID ).matchcontaimuser,
      

      child:  Container(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Matchview(),
        ),
      
    );
    }
  }
}