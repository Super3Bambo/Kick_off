import 'package:flutter/material.dart';
import 'package:flutter_app/models/LeagueMatches.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'NoMAtches.dart';



class AllMatchLeagueItem extends StatelessWidget {


  final LeagueMatch match;
  final Team teamid;
  int index;
  AllMatchLeagueItem({ this.match ,this.teamid , this.index});

  @override
  Widget build(BuildContext context) {
if(match.team.length==2){    
return  Card(
  elevation: 10.0,
          margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
         
          shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
          ),
            child: new Column(
            children: <Widget>[
                Container(
                    height: 77,
                    child: Row(
                      
                              mainAxisAlignment:MainAxisAlignment.start,
                              mainAxisSize:MainAxisSize.max ,
                              crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        
                           Container(
                             margin: EdgeInsets.only(left:30),
                             width: 40,
                             child: CircleAvatar(
                               radius: 30.0,
                               backgroundColor: Colors.brown[300],
                               backgroundImage: AssetImage('images/1.jpg' ,),
                             ),
                           ),
                           Row(
                             
                             children: <Widget>[
                                Container(
                                   margin: EdgeInsets.only(left:23),
                                  width: 90,
                                  
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                   Container(
                                     child: Icon(Icons.date_range,size: 25,)),
                                  Container(
                                   child: Text(match.Check_in.substring(6,16),style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                 
                                  
                               ],),
                                ),

                               Container(
                                 margin: EdgeInsets.only(left:23),
                                 width: 70,
                                 child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.min,
                                  
                                   children: <Widget>[
                                   
                                     Container(
                                       child: Icon(FontAwesome.sort ,size: 22,)),
                                     Container(
                                     child: Text((index+1).toString(),style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                 ],),
                               ),
                                Container(
                                  margin: EdgeInsets.only(left:23),
                                  width: 70,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.min,
                                  
                                   children: <Widget>[
                                   
                                      Container(
                                       child: Icon(Icons.location_on,size: 25,)),  
                                     Container(
                                     child: Text(match.Location ,style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                               ],),
                                ),
                             ],
                           )
                            
                        
                      ],
                    ),
                   
                  ),
      
        ],
      )
      );
      }else{ return nomatches();}
  
  }
}