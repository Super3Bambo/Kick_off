import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import './teamMembers.dart';
import './teamBoard.dart';
import 'package:intl/intl.dart';

import 'Friends_Overview.dart';

class TeamItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    goback(){Navigator.pop(context);}

    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
          User user =Provider.of<User>(context);
          List<User> users =[
            User(ID: user.ID),
          ];
        Team team = Provider.of<Team>(context);
        godetails(Team id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> TeamBoard(team: team)  ) );}
godetails2(){
Navigator.push(context,MaterialPageRoute(builder: (context)=> FriendsOverview(team: team)  ) );}



if(team!=null){
  return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userData = snapshot.data;
          Leave()async{
            if(team.users.length!=1){

              await TeamService().disjoinTeam(team.ID, users);
              String teamid="";

              await UserService(userid: user.ID).updateUserData(userData.FName, userData.LName, userData.Age, userData.Position, userData.Area, userData.Phone,
                  userData.Photo_url, teamid, userData.Token);
            }

            else{
              await TeamService().deleteteam(team.ID);
              String teamid="";
              await UserService(userid: user.ID).updateUserData(userData.FName, userData.LName, userData.Age, userData.Position, userData.Area, userData.Phone,
                  userData.Photo_url, teamid, userData.Token);

            }
          }

          openAlertBox_twobutton(  String title , String content ) {
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
                                title,
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
                              child: Text(content ,maxLines: 2, style:
                              TextStyle(wordSpacing: 1.5 ,height: 2 ,fontWeight: FontWeight.bold),),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center ,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: 148,
                                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                                  decoration: BoxDecoration(
                                    color:  Color(0xff00bfa5),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(32.0),
                                      // bottomRight: Radius.circular(32.0)
                                    ),
                                  ),
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap:() async{
                                  if(team.users.length!=1){

                                    await TeamService().disjoinTeam(team.ID, users);
                                    String teamid="";

                                    await UserService(userid: user.ID).updateUserData(userData.FName, userData.LName, userData.Age, userData.Position, userData.Area, userData.Phone,
                                        userData.Photo_url, teamid, userData.Token);
                                  }

                                  else{
                                    await TeamService().deleteteam(team.ID);
                                    String teamid="";
                                    await UserService(userid: user.ID).updateUserData(userData.FName, userData.LName, userData.Age, userData.Position, userData.Area, userData.Phone,
                                        userData.Photo_url, teamid, userData.Token);

                                  } Navigator.pop(context);
                                },
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red
                                ),
                                //color: Colors.red,
                                width: 4,
                              ),

                              InkWell(
                                child: Container(

                                  width: 148,
                                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                                  decoration: BoxDecoration(
                                    color:  Color(0xff00bfa5),
                                    borderRadius: BorderRadius.only(
                                      // bottomLeft: Radius.circular(32.0),
                                        bottomRight: Radius.circular(32.0)),
                                  ),
                                  child: Text(
                                    "No",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: ()=>Navigator.pop(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            );
          }

   return Container(
          margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0),
                  child: SingleChildScrollView(
                                      child: Center(
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                 // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new ClipRRect(
                        child: /*Image(
                          image: AssetImage('images/5omasy.jpg'),
                          fit: BoxFit.cover,
                        ),*/
                                     Container(
                                      margin: EdgeInsets.all(9.0), 
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          child: team.Photo!=null? Image.network( team.Photo ,fit: BoxFit.cover, width: 400,height: 280,
                        ):Image.network( 'https://image.freepik.com/free-vector/character-football-team-players-holding-trophy_16539-56.jpg' ,fit: BoxFit.cover),
                                        ),
                                      )
                                     
                      ),
                      new Padding(
                        padding: new EdgeInsets.all(16.0),
                        child: new Column(

                          
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          
                          children: <Widget>[

                            
                              
                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment:MainAxisAlignment.start,

                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top:10,),
                                  child:
                                  Icon(FontAwesome.calendar, size: 20, color: Colors.blueAccent,semanticLabel:'Found' ,), ),
                                  Container(
                                    margin: EdgeInsets.only(left:110 ,top: 10),
                                        child: Text(dateFormat.format(team.Date.toDate()).substring(0,11) ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                                  
                               
                                ],),
                                 Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment:MainAxisAlignment.start,

                                  children: <Widget>[
                                     Container(
                                      margin: EdgeInsets.only(top:10,),
                                  child: Icon(FontAwesome.sort_numeric_asc , size: 20, color: Colors.blue,),),
                                  Container(
                                    margin: EdgeInsets.only(left:110, top: 10),
                                        child: Text( team.users.length.toString() +' of ' + team.NO_team ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                                  
                                  
                                ],),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,

                                  children: <Widget>[
                                    Container(
                                      //margin: EdgeInsets.only(top:10,),
                                        child: Text('Info',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                ),
                                    Container(
                                     // margin: EdgeInsets.only(left:50,top: 2 ,right: 0),
                                  child:IconButton(icon: Icon(FontAwesome.info_circle,color: Colors.white,), onPressed: ()=> godetails(team),autofocus: true,
                                  focusColor:Colors.grey , hoverColor: Colors.red[900],padding: EdgeInsets.all(10),
                                  ) 
                                  ),
                                   Container(
                                      //margin: EdgeInsets.only(top:12, right: 10),
                                        child: Text('Leave',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                ),
                                  Container(
                                   //   margin: EdgeInsets.only(top: 0 ),
                                  child: IconButton(icon: Icon(FontAwesome.sign_out , size: 30, color: Colors.red[900] ,),
                                      onPressed: (){

                                        openAlertBox_twobutton(  'Caution' , 'Are you sure you want to leave this team?'); }

                          /*      onPressed:()async{
                                  if(team.users.length!=1){
                             
                          await TeamService().disjoinTeam(team.ID, users);
                                String teamid="";
                            
                          await UserService(userid: user.ID).updateUserData(userData.FName, userData.LName, userData.Age, userData.Position, userData.Area, userData.Phone, 
                                  userData.Photo_url, teamid, userData.Token);
                                  }
                                  
                                  else{
                             await TeamService().deleteteam(team.ID);
                             String teamid="";
                          await UserService(userid: user.ID).updateUserData(userData.FName, userData.LName, userData.Age, userData.Position, userData.Area, userData.Phone, 
                          userData.Photo_url, teamid, userData.Token);
                            
                                }
                                }*/
                                )),
                                Container(
                                     // margin: EdgeInsets.only(top:10,),
                                        child: Text('Invite',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                ),
                                    Container(
                                   //   margin: EdgeInsets.only(left:20,top: 2 ,right: 0),
                                  child:IconButton(icon: Icon(FontAwesome.plus_square,color: Colors.green[900],), onPressed: ()=>godetails2(),
                                  ) 
                                  ),
                                  
                                ],
                                ),

                                 Container(
                                 margin: EdgeInsets.only(top:15,bottom: 10) ,
                                 child:Row(
                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              mainAxisSize:MainAxisSize.max,
                              crossAxisAlignment:CrossAxisAlignment.start,
                                   children: <Widget>[
                                      Text('ATTACK' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                   Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: new LinearPercentIndicator(
                                        width: 220,
                                        animation: true,
                                        lineHeight: 18.0,
                                        animationDuration: 2000,
                                        percent: .35,
                                        center: Text('35%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                        progressColor: Colors.redAccent[700],
                                        backgroundColor: Colors.white70,
                                      ),
                                    ),
                               // IconToggle(value: true ,activeColor: Colors.yellow,),
                              ],

                            ),),
                                 Container(
                                 margin: EdgeInsets.only(top:15,bottom: 10) ,
                                 child:Row(
                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              mainAxisSize:MainAxisSize.max,
                              crossAxisAlignment:CrossAxisAlignment.start,
                                   children: <Widget>[
                                      Text('MIDFIELDER' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                   Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: new LinearPercentIndicator(
                                        width: 220,
                                        animation: true,
                                        lineHeight: 18.0,
                                        animationDuration: 2000,
                                        percent: .35,
                                        center: Text('35%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                        progressColor: Colors.green[900],
                                        backgroundColor: Colors.white70,
                                      ),
                                    ),
                               // IconToggle(value: true ,activeColor: Colors.yellow,),
                              ],

                            ),),
                                 Container(
                                 margin: EdgeInsets.only(top:15,bottom: 0) ,
                                 child:Row(
                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              mainAxisSize:MainAxisSize.max,
                              crossAxisAlignment:CrossAxisAlignment.start,
                                   children: <Widget>[
                                      Text('DEFENCE' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                   Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: new LinearPercentIndicator(
                                        width: 220,
                                        animation: true,
                                        lineHeight: 18.0,
                                        animationDuration: 2000,
                                        percent: .35,
                                        center: Text( '35%',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                        progressColor: Colors.blue[400],
                                        backgroundColor: Colors.white70,
                                      ),
                                    ),
                               // IconToggle(value: true ,activeColor: Colors.yellow,),
                              ],

                            ),),
                              
                              ],
                            ),

                            
                            new Row(
                           mainAxisAlignment:MainAxisAlignment.center,

                              children: <Widget>[
                               
                              ])])
                              ),
                                
                              ]
                              )
                              )
                              )
                              );
    
/*godetails(Team id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> TeamBoard(team: team)  ) );}
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
         onTap: () => godetails(team), 
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(team.Name),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(team.NO_team),
      ),
    )
    );*/
        }else{return Loading();}});

}else{return Loading();} 
  }
}
