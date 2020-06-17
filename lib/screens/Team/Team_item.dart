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

class TeamItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
          User user =Provider.of<User>(context);
          List<User> users =[
            User(ID: user.ID),
          ];
        Team team = Provider.of<Team>(context);
        godetails(Team id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> TeamBoard(team: team)  ) );}
if(team!=null){
  return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userData = snapshot.data;
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment:MainAxisAlignment.start,

                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top:10,),
                                        child: Text('Info',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                ),
                                    Container(
                                      margin: EdgeInsets.only(left:90,top: 2 ,right: 50),
                                  child:IconButton(icon: Icon(FontAwesome.info_circle,color: Colors.red[900],), onPressed: ()=> godetails(team),autofocus: true,
                                  focusColor:Colors.grey , hoverColor: Colors.red[900],padding: EdgeInsets.all(10),
                                  ) 
                                  ),
                                   Container(
                                      margin: EdgeInsets.only(top:12, right: 15),
                                        child: Text('Leave',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                ),
                                  Container(
                                      margin: EdgeInsets.only(top: 0 ),
                                  child: IconButton(icon: Icon(FontAwesome.sign_out , size: 30, color: Colors.purpleAccent ,), 
                                onPressed:()async{
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
                                ))
                                  
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
                                        width: 250,
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
                                        width: 250,
                                        animation: true,
                                        lineHeight: 18.0,
                                        animationDuration: 2000,
                                        percent: .35,
                                        center: Text('35%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
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
                                        width: 250,
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
