import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/League.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Matches/Friends_Overview.dart';
import '../../models/Matches.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'LeagueMemberOverView.dart';



class League_Details extends StatefulWidget{
  
  
final League league;
  final Team teamid;
  League_Details({ this.league  , this.teamid});
 
  @override
  _League_DetailsState createState() => _League_DetailsState();
}

class _League_DetailsState extends State<League_Details> {
    //final FirebaseMessaging _fcm=FirebaseMessaging();


bool loading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
List <Team> tmid=[
    Team(ID:widget.teamid.ID,),
  ];

  List <League> lgid=[
    League(ID:widget.league.ID,),
  ];
    List<String> lists = List<String>();
    List<String> templist = List<String>();


  List<String> myList = List<String>();
    myList = widget.league.teams.map((f)=>f.ID).toList();
godetails(Match id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> FriendsOverview()  ) );

}
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");

 // String matchId = widget.matchid.ID;  

_showSnackBar() {
    final snackBar = new SnackBar(
        content: new Text("Your Team Join The League"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back',
         onPressed: (){
           Navigator.pop(context);
        }),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


    _showSnackBar2() {
    final snackBar = new SnackBar(
        content: new Text("Your Team Already in The League"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back',
         onPressed: (){
           Navigator.pop(context);
        }),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  _showSnackBar3() {
    final snackBar = new SnackBar(
        content: new Text("League is full"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back',
         onPressed: (){
           Navigator.pop(context);
        }),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

            return  Scaffold(
             key: _scaffoldKey,
              appBar: AppBar(
              title: Text(widget.league.Name),
              ),
              body: Container(
                              margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: SingleChildScrollView(
                                      child: Center(
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                 // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new ClipRRect(
                        child: Image(
                          image: AssetImage('images/5omasy.jpg'),
                          fit: BoxFit.cover,
                        ),
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
                                  Icon(FontAwesome.calendar, size: 20, color: Colors.blueAccent,),),
                                  Container(
                                    margin: EdgeInsets.only(left:110 ,top: 10),
                                        child: Text('fdsfs' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                                  
                               
                                ],),
                                 Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment:MainAxisAlignment.start,

                                  children: <Widget>[
                                     Container(
                                      margin: EdgeInsets.only(top:10,),
                                  child: Icon(FontAwesome.clock_o , size: 20, color: Colors.blue,),),
                                  Container(
                                    margin: EdgeInsets.only(left:110, top: 10),
                                        child: Text(widget.teamid.ID ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                                  
                                  
                                ],),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                   mainAxisAlignment:MainAxisAlignment.start,

                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top:10,),
                                  child: Icon(FontAwesome.dollar, size: 20,color: Colors.green,),),
                                  Container(
                                    margin: EdgeInsets.only(left:110,top: 10),
                                        child: Text(widget.league.teams.isEmpty?'0': widget.league.teams.length.toString() +" " + '\$',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                                  
                                  
                                ],
                                ),

                                 Container(
                                 margin: EdgeInsets.only(top:15,bottom: 10) ,
                                 child:Row(
                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              mainAxisSize:MainAxisSize.max,
                              crossAxisAlignment:CrossAxisAlignment.start,
                                   children: <Widget>[
                                  Icon(FontAwesome.bath , size: 30,),
                                  Icon(Ionicons.md_football ,size: 30,),
                                  Icon(MaterialIcons.person_outline, size: 30, /*color: widget.val?Colors.yellow : Colors.red*/),
                               // IconToggle(value: true ,activeColor: Colors.yellow,),
                              ],

                            ),),

                                  CircularPercentIndicator(
                                      radius: 100.0,
                                      lineWidth: 7.0,
                                      percent: 1.toDouble()/10,
                                      header: Padding(padding: EdgeInsets.fromLTRB(00.0, 20.0, 00.0,00.0),),
                                      center: Container(
                                        margin: EdgeInsets.only(top: 25),
                                        child: Column(
                                          children:[
                                           
                                            Icon(
                                        Icons.person_pin,
                                        size: 40.0,
                                        color: Colors.blue,
                                        
                                      ),
                                       Text( '10' ,style: TextStyle(fontWeight: FontWeight.bold),),

                                          ]
                                        ),
                                      ),/* */
                                      footer: Padding(padding: EdgeInsets.fromLTRB(00.0, 0.0, 00.0,20.0),),
                                      backgroundColor: Colors.grey,
                                      progressColor: Colors.blue,
                                        ),
                              ],
                            ),
                                      
                          new Row(
                           mainAxisAlignment:MainAxisAlignment.start,

                              children: <Widget>[

                          SizedBox(height: 20.0,width: 60,),
                        RaisedButton(
                           padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                          color: Colors.pink[300],
                          child: Text(
                            'Join',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if(myList.contains(widget.teamid.ID)){
                              _showSnackBar2();
                             // print(myList);
                            }
                            else if(myList.length==8){
                              _showSnackBar3();
                            }
                            else if(widget.teamid.users.length<5){
                               _showSnackBar3();
                            }
                            else{
                           await LeagueService().joinLeague(widget.league.ID, tmid);
                           //await TeamService().joinLeague(widget.teamid.ID, lgid);
                           for(var i=0;i<(7-widget.league.teams.length);i++){
                             DateTime starttime = dateFormat.parse(widget.league.Start_Date);
                             var star =starttime.add(Duration( days: i , hours: (widget.league.teams.length+i)));
                             String start = dateFormat.format(star);

                             DateTime finishtime = dateFormat.parse(start);
                             var end =finishtime.add(Duration(hours:1));
                             String finish = dateFormat.format(end);
                              List<Field> starts=[
                                          Field(Start_at:dateFormat.format(star) )
                                        ];
                                        List<Field> finishs=[
                                          Field(Finish_at:dateFormat.format(end) )
                                        ];
                             await LeagueService(id: widget.league.ID , teamid: widget.league.ID+'match' ,i:  widget.teamid.ID+ i.toString() ).
                              addmatch_to_league(widget.league.Field,start , finish, tmid, widget.league.Location);
                             await FieldService().timestart(widget.league.Field, starts);
                             await FieldService().timefinish(widget.league.Field, finishs);
                           }
                          
                            lists.add(widget.teamid.ID);
                           _showSnackBar();
                            if(widget.league.teams.length+1==8){
                              myList.addAll(lists);
                              myList.toSet();
                              templist.addAll(myList);

                              for(var i=0; i<(myList.length-1);i++){
                                for(var j=0 ;j<(templist.length);j++ ){
                                  var owner= myList[i];
                                  templist.removeWhere((element) => element==owner);
                                  List <Team> teamdata=[
                                  Team(ID:templist[j]),];
                                 await LeagueService(id: widget.league.ID , teamid: widget.league.ID+'match' , i:owner+j.toString()).joinmatchLeague( teamdata);

                                }
                              }                           _showSnackBar2();
                             
                            
                             }
                            }
                          }
              

                            
                    ),
                    RaisedButton(padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                          color: Colors.pink[300],
                          child: Text(
                            'Members',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            print(myList);
                            print(templist);
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> LeaguememberOverview(leagueid:myList,)  ) );


                          }
                          ),
                      
                       widget.league.teams.length>0?Container(width:0):  myList.contains(widget.teamid.ID)?  RaisedButton(padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                          color: Colors.pink[300],
                          child: Text(
                            'DisJoin',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            LeagueService().disjoinLeague(widget.league.ID, tmid);
                            Navigator.pop(context);

                          }
                          ):Container(width: 0,)
                    
                    
                    
                    ]

                    ),
                    ]
                    ),
                    ),
                    ]
                    ),
                    )
                    )
                    )
                    );
                        
              
 //),
    
       

  


              
      //                 FlatButton(
    //                child: Text('Book NOW'),
  //                  onPressed: () {
//                      )



  }}