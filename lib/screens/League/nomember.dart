import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/User/Tempfollow.dart';

import '../../models/Matches.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/User.dart';
import '../../Services/User.dart';
import 'LeagueMemberListview.dart';

class NOMEMBER extends StatelessWidget {

  final String title,content;
  NOMEMBER({@required this.title ,@required this.content});
  

  @override
  Widget build(BuildContext context) {
    

    return  Scaffold(
        appBar: AppBar(
          title:Text(title)         
        ),
        body: Center(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: Text(content),
      ),
    );
  }
}