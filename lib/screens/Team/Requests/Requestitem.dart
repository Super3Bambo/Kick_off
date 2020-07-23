import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/Services/Payment.dart';
import 'package:flutter_app/Services/Request_team.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/Payment.dart';
import 'package:flutter_app/models/Request.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/team.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';




class RequestsItem extends StatefulWidget {



  final Request req ; 
  RequestsItem({ this.req });

  @override
  _RequestsItemState createState() => _RequestsItemState();
}

class _RequestsItemState extends State<RequestsItem> {
String message;

var list1;

var list2;

  @override
  Widget build(BuildContext context) {
    

    openAlertBox( String Title , String Content) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        Title,
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Container(
                      margin: EdgeInsets.only(top:2),
                      height:100,
                      child: Text(Content,maxLines: 2, style: 
                      TextStyle(wordSpacing: 1.5 ,height: 2 ,fontWeight: FontWeight.bold),),
                    ),
                    // child: TextField(
                      
                    //   decoration: InputDecoration(
                        
                    //     hintText: "fdjignfdkgnfdkjgndfl;gmfdjlkighsdlf",
                    //     border: InputBorder.none,
                    //   ),
                    //   maxLines: 5,
                    // ),
                  ),
                       
                       InkWell(
                        child: Container(
                         
                          //width: 148,
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                             color:  Colors.blue[300],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                                bottomRight: Radius.circular(32.0)),
                          ),
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: ()=>Navigator.pop(context),
                      ),


                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.center ,
                  //   children: <Widget>[
                  //     InkWell(
                  //       child: Container(
                  //         width: 148,
                  //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  //         decoration: BoxDecoration(
                  //           color:  Color(0xff00bfa5),
                  //           borderRadius: BorderRadius.only(
                  //               bottomLeft: Radius.circular(32.0),
                  //              // bottomRight: Radius.circular(32.0)
                  //               ),
                  //         ),
                  //         child: Text(
                  //           "OK",
                  //           style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.red
                  //       ),
                  //       //color: Colors.red,
                  //       width: 4,
                  //     ),
                     
                  //      InkWell(
                  //       child: Container(
                         
                  //         width: 148,
                  //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  //         decoration: BoxDecoration(
                  //            color:  Color(0xff00bfa5),
                  //           borderRadius: BorderRadius.only(
                  //              // bottomLeft: Radius.circular(32.0),
                  //               bottomRight: Radius.circular(32.0)),
                  //         ),
                  //         child: Text(
                  //           "Cancel",
                  //           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //       onTap: (){},
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        });}

    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:00:000");
DateTime temp =DateTime.now();



  return StreamBuilder<User>(
      stream: UserService(userid: widget.req.UserID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userdata = snapshot.data;
          List <User> users=[
    User(ID: userdata.ID,),
  ];
        return StreamBuilder<Team>(
      stream: TeamService(teamids:widget.req.TeamID).teamone,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Team teamdata = snapshot.data;



          return Container(
  //padding: EdgeInsets.only(top:10),
  margin: EdgeInsets.only(bottom: 5 ,top: 10),
  width: 420,
  height: 220,
  child:   Card(
    elevation: 10.0,
      margin:EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
  
    
    
     child:Row(
       mainAxisSize: MainAxisSize.min,
     crossAxisAlignment: CrossAxisAlignment.center,
     
     children: <Widget>[
      
       Container(
             child: Container(
               padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
  
  child: Container(
    child:   Padding(
            padding: const EdgeInsets.only(bottom: 20 , top: 10) ,
            
            child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
            mainAxisSize:MainAxisSize.max,
           crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[ 
               
                 Container(
                   margin: EdgeInsets.only(top:10),
                         child: Text(userdata.FName+ ' ' + userdata.LName +' ' + 'Request' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),), 
                          Container(
                   margin: EdgeInsets.only(top:5),
                         child: Text(  'Position:'+' ' + userdata.Position , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),), 
                          Row(
                            children: <Widget>[

                               Container( child: Text( message??'' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),)),
                              // Container(margin: EdgeInsets.only(left:12),child: Text('Duration:'+' '+ temp.toString() , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),)),
                              
                            ],
                 
                         
                         
                         ),  
                         //Container(child: Text('Price:'+' '+ (temp*int.tryParse(matchdata.Price)).toString() + '\$'  , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),)),  
                   Padding(
                  padding: EdgeInsets.all(2.0),
                  child: new LinearPercentIndicator(
                    width: 200,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: teamdata.users.length/int.tryParse(teamdata.NO_team).toDouble(),
                    center:  Text((teamdata.users.length*100/int.tryParse(teamdata.NO_team)).toString() + '%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.blue,
                  ),
                ),


                Container(
                  margin: EdgeInsets.only(top:7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:47, right:50 ),
                        child: RaisedButton(
                           shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blue)
                                ),
                                padding: const EdgeInsets.all(0.0),
                                textColor: Colors.white,
                                 // color: Colors.blue[700],
                                  child: Container(
                                    decoration:  BoxDecoration(
                                      borderRadius:BorderRadius.circular(20) ,
                                                  gradient: LinearGradient(
                                                    colors: <Color>[
                                                      Color(0xFF0D47A1),
                                                      Color(0xFF42A5F5),
                                                    ],
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(10.0),                                  
                                      child: Text(
                                      '   Confirm  ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                          
                          
                          onPressed: ()async{

                        if(teamdata.users.length==int.tryParse(teamdata.NO_team)){
                              setState(() {
                                message='team reach limit';
                              });}else{
                            
                            if(userdata.TeamID==''){
                               await   TeamService().joinTeam(teamdata.ID, users);
                    await UserService(userid: userdata.ID).updateUserData(userdata.FName, userdata.LName, userdata.Age, userdata.Position, userdata.Area, userdata.Phone, 
                          userdata.Photo_url, teamdata.ID, userdata.Token);
                          RequestService().editrequesttojointeam(widget.req.ID, widget.req.UserID, widget.req.TeamID, widget.req.Date);
                            }
                            
                            else{
                              setState(() {
                                message='Already in team now';
                              });
                            }}

                                          
                        }),
                      ),
                        Container(
                          
                   child: RaisedButton(
                           shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blue)
                                ),
                                padding: const EdgeInsets.all(0.0),
                                textColor: Colors.white,
                                 // color: Colors.blue[700],
                                  child: Container(
                                    decoration:  BoxDecoration(
                                      borderRadius:BorderRadius.circular(20) ,
                                                  gradient: LinearGradient(
                                                    colors: <Color>[
                                                      Color(0xFF0D47A1),
                                                      Color(0xFF42A5F5),
                                                    ],
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(10.0),                                  
                                      child: Text(
                                      '    Delete   ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  onPressed: ()async{},
                  ) )        
                    ],
                  ),
                ),
              
                  
     ],
       
          
            ),
            ),
  )),
              ),
       
     ],)
     
  ),
  );
            
          
            }else{return Loading();}
            });
            }else{return Loading();}
            }
            );
  
}}