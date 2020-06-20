import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Invations.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/Invite.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Matches/Match_Details_Progress.dart';
import 'package:flutter_app/screens/Team/InviteJoinTeam.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:intl/intl.dart';




class inviteItem extends StatelessWidget {



  final Invite invite ; 
  inviteItem({ this.invite });

  
String message;

  @override
  Widget build(BuildContext context) {

    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:00:000");
DateTime temp =DateTime.now();

       User user = Provider.of<User>(context);

   // godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Friends_Details(userid: widget.friends)  ) );}
if(invite.Type.length==4){
  return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User senderdata = snapshot.data;
          return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User recieverdata = snapshot.data;
        return StreamBuilder<Team>(
      stream: TeamService(userid:invite.MatchID).teamone,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Team teamdata = snapshot.data;
    //  DateTime c = dateFormat.parse(matchdata.Check_in);

      godetails( ){Navigator.push(context,MaterialPageRoute(builder: (context)=> TeamIteminvite(team: teamdata ,userData: recieverdata,)  ) );}

          return Container(
  //padding: EdgeInsets.only(top:10),
  margin: EdgeInsets.only(bottom: 5 ,top: 10),
  width: 420,
  height: 150,
  child:   Card(
    
      margin:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
  
    child: ClipRRect(
      
            borderRadius: BorderRadius.circular(20),
    
     child:Row(mainAxisSize: MainAxisSize.min,
     crossAxisAlignment: CrossAxisAlignment.center,
     
     children: <Widget>[
      
  
       Container(
         //margin: EdgeInsets.only(right:20),
         child: ClipRRect(
              //borderRadius: BorderRadius.circular(20),
  
         child:  GestureDetector(
           onTap: () => godetails(),
         
         
         child: Image.network(teamdata.Photo, height: 140, width: 115, fit: BoxFit.cover, ),),
         ),
       ), 
       InkWell(
        onTap: () => godetails(),
              child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
  
                            child: Container(
                 // color :Color.fromRGBO(207, 243, 246, 100) ,
                   padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
                       //  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
  
  
  child: Container(
    //margin: EdgeInsets.only(bottom:100),
    child:   Padding(
            padding: const EdgeInsets.only(bottom: 20 , top: 10) ,
    
            
            child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
            mainAxisSize:MainAxisSize.max,
           crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[ 
               
                 Container(
                         child: Text(senderdata.FName+' ' + 'Invited you to this Team'),
                       ),    
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[    
                      
                       Padding(
                  padding: EdgeInsets.all(2.0),
                  child: new LinearPercentIndicator(
                    width: 200,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: teamdata.users.length/10.toDouble(),
                    center: Text(((teamdata.users.length*100)/int.tryParse(teamdata.NO_team)).toString() + '%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.blue,
                  ),
                ),
                   
                 // Container(child: IconButton(icon: Icon(FontAwesomeIcons.locationArrow , color: Colors.blue ,size: 25,), onPressed:(){}))
    
                     ]
                  ),
                  Container(
                      margin: EdgeInsets.only(top:20),
                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                     children: <Widget>[    
    
                   Container(margin: EdgeInsets.only(right:15), child: Text(teamdata.Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                Container(  child:  Text( 
                 'wait for' +' ' +(int.tryParse(teamdata.NO_team)-teamdata.users.length).toString()+' '+'players' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ),
              //     Text(  matchdata.Location ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
                  ]))
                  
                 
                  
     ],
       
          
            ),
            ),
  )),
              ),
       )
     ],)
     
  )),
  );
            
            }
            else{return Loading();}
            });
            }else{return Loading();}
            });
            }else{return Loading();}
            }
            );
  
}
else{
    return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User senderdata = snapshot.data;
          return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User recieverdata = snapshot.data;
        return StreamBuilder<Match>(
      stream: MatchService(matchid:invite.MatchID).matchData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Match matchdata = snapshot.data;
      DateTime c = dateFormat.parse(matchdata.Check_in);

      godetails( ){
Navigator.push(context,MaterialPageRoute(builder: (context)=> Match_DetailsProgress(matchid: matchdata)  ) );}
var now= DateTime.now();
var diff= c.difference(now).inHours.toString();
          return Container(
  //padding: EdgeInsets.only(top:10),
  margin: EdgeInsets.only(bottom: 5 ,top: 10),
  width: 420,
  height: 150,
  child:   Card(
    
      margin:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
  
    child: ClipRRect(
      
            borderRadius: BorderRadius.circular(20),
    
     child:Row(mainAxisSize: MainAxisSize.min,
     crossAxisAlignment: CrossAxisAlignment.center,
     
     children: <Widget>[
      
  
       ClipRRect(
            //borderRadius: BorderRadius.circular(20),
  
       child:  GestureDetector(
         onTap: () => godetails(),
       
       
       child: Image.asset('images/5omasy.jpg', height: 140, width: 115, fit: BoxFit.cover, ),),
       ), 
       InkWell(
         onTap: () => godetails(),
              child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
  
                            child: Container(
                 // color :Color.fromRGBO(207, 243, 246, 100) ,
                   padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
                       //  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
  
  
  child: Container(
    //margin: EdgeInsets.only(bottom:100),
    child:   Padding(
            padding: const EdgeInsets.only(bottom: 20 , top: 10) ,
    
            
            child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
            mainAxisSize:MainAxisSize.max,
           crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[ 
                 Container(
                         child: Text(senderdata.FName + 'Invited you to this match'),
                       ),    
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[    
                      
                       Padding(
                  padding: EdgeInsets.all(2.0),
                  child: new LinearPercentIndicator(
                    width: 200,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: matchdata.users.length/10.toDouble(),
                    center: Text((matchdata.users.length*10).toString() + '%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.blue,
                  ),
                ),
                   
                  Container(child: IconButton(icon: Icon(FontAwesomeIcons.locationArrow , color: Colors.blue ,size: 25,), onPressed:(){}))
    
                     ]
                  ),
                  Container(
                      margin: EdgeInsets.only(top:20),
                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                     children: <Widget>[    
    
                  Container(margin: EdgeInsets.only(right:15), child: Text(' After' +':' +diff +' ' +'H', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
               Container(margin: EdgeInsets.only(right:36),  child:  Text(  matchdata.Price + '\$',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ),
                  Text(  matchdata.Location ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
                  ]))
                  
                 
                  
     ],
       
          
            ),
            ),
  )),
              ),
       )
     ],)
     
  )),
);
            
            }else{return Loading();}
            });
            }else{return Loading();}
            });
            }else{return Loading();}
            }
            );}

  }
}
