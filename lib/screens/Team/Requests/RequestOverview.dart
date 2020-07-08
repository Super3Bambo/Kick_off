import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Invations.dart';
import 'package:flutter_app/Services/Payment.dart';
import 'package:flutter_app/Services/Request_team.dart';
import 'package:flutter_app/models/Payment.dart';
import 'package:flutter_app/models/Request.dart';
import 'package:provider/provider.dart';

import 'Requestlistview.dart';



class RequestsOverview extends StatelessWidget {
  String teamid;
  
RequestsOverview({this.teamid});
  

  @override
  Widget build(BuildContext context) {


return StreamProvider<List<Request>>.value(

      value: RequestService(teamid: teamid).requestlist,

     
        child: Container(
       
            child:RequestsList() ,
          ),
        
    
    );
  }
  }