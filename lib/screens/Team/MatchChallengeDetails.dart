import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/team.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import '../../models/Matches.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:getflutter/getflutter.dart';
import 'package:intl/intl.dart';

import 'MemberOverView.dart';



class MatchChallenge_Details extends StatefulWidget{

  final Match matchid;
  final Team team;
  bool val =false;

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  MatchChallenge_Details({this.matchid , this.team});


  @override
  _MatchChallenge_DetailsState createState() => _MatchChallenge_DetailsState();
}

class _MatchChallenge_DetailsState extends State<MatchChallenge_Details> {

  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
 DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");




  @override
  Widget build(BuildContext context) {

    gomember(Match id) { Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverview(matchid: widget.matchid)  ) );}

    List <Team> team=[
      Team(ID: widget.team.ID,),
    ];
    List<String> myList = List<String>();
    myList = widget.matchid.team.map((f)=>f.ID).toList();
    String matchId = widget.matchid.ID;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    penAlertBox_onebutton(   String title , String content ) {
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

                    InkWell(
                      child: Container(

                        //width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Colors.blue,
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
                    ),],
                ),
              ),
            );
          }
      );
    }
    penAlertBox_onebutton2(   String title , String content ) {
      return showDialog(
          context: _scaffoldKey.currentContext,
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

                    InkWell(
                      child: Container(

                        //width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Colors.blue,
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
                    ),],
                ),
              ),
            );
          }
      );
    }

    _showSnackBar() {
      final snackBar = new SnackBar(
        content: new Text("You already in this Match"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back', onPressed: (){
          Navigator.pop(context);
        }),
      );
      //How to display Snackbar ?
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    _showSnackBar2() {
      final snackBar = new SnackBar(
        content: new Text("Match Complete"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back', onPressed: (){
          Navigator.pop(context);
        }),
      );
      //How to display Snackbar ?
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    _showSnackBar3() {
      final snackBar = new SnackBar(
        content: new Text("Join to match Done"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back', onPressed: (){
          Navigator.pop(context);
        }),
      );
      //How to display Snackbar ?
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    return  Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.matchid.Counter.toString()),
      ),


      body: Container(
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
                        ),*/GFCarousel(
                    items: widget.imageList.map(
                          (url) {
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                              //width: 1000.0
                            ),
                          ),
                        );
                      },
                    ).toList(),
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
                                child: Text(widget.matchid.Check_in.substring(0,10) ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                                child: Text(widget.matchid.Check_in.substring(11,16) ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                                child: Text(widget.matchid.Price +" " + '\$',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                            percent: widget.matchid.team.length.toDouble()/10,
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
                                    Text( widget.matchid.team.length.toString() + '' '/' '' '${10}',style: TextStyle(fontWeight: FontWeight.bold),),

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
                        mainAxisAlignment:MainAxisAlignment.center,

                        children: <Widget>[

                          SizedBox(height: 20.0,),
                          RaisedButton(
                              padding: EdgeInsets.fromLTRB(30.0,10.0,30.0,10.0),
                              color: Colors.blueAccent,
                              child: Text(
                                'Join',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {


                                  List<String> startteam = List<String>();
                                        startteam = widget.team.start_time.map((e) => e.Start_at).toList();
                                  List<String> finishteam = List<String>();
                                        finishteam =widget.team.finish_time.map((e) => e.Finish_at).toList();
                                  List<String> durationteam = List<String>();
                                         durationteam =widget.team.duration.map((e) => e.Duration).toList();


                                if(myList.contains(widget.team.ID)){

                                  _showSnackBar();



                                }

                                else if (widget.matchid.Counter==2) {
                                  _showSnackBar2();
                                }

                                else{
                                  
                                      var f=dateFormat.parse(widget.matchid.Check_in);
                                       var s=dateFormat.parse(widget.matchid.Check_out);
                                    
                                      var duration =f.add(new Duration(hours: 1));
                                      var duration2=s.subtract(new Duration(hours: 1));
                                      var durs2=dateFormat.format(duration2);
                                      var durs=dateFormat.format(duration);
                                      List<Field> starts=[
                                        Field(Start_at:widget.matchid.Check_in )];
                                          List<Field> finishs=[
                                        Field(Finish_at:widget.matchid.Check_out )];
                                         List<Field> dur=[
                                    Field(Duration:dateFormat.format(duration) ) ,Field(Duration:dateFormat.format(duration2) )];


                                      
                                      if(finishteam.contains((widget.matchid.Check_in))||finishteam.contains(widget.matchid.Check_out)||
                                   finishteam.contains(durs)||finishteam.contains(durs2)){
                                     //   Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
                                        penAlertBox_onebutton2(   'Error' , 'You have a match in the same time');

                                      }
                                    
                                    else if(startteam.contains(widget.matchid.Check_in)||startteam.contains(widget.matchid.Check_out)|| 
                                    startteam.contains(durs) || startteam.contains(durs2)){
                                          //Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
                                        penAlertBox_onebutton2(   'Error' , 'You have a match in the same time');

                                      }
                                   else  if(durationteam.contains(widget.matchid.Check_in)||durationteam.contains(widget.matchid.Check_out)|| 
                                   durationteam.contains(durs)||durationteam.contains(durs2)){
                                     
                                    //    Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();}
                                    penAlertBox_onebutton2(   'Error' , 'You have a match in the same time');}


                                   var count= (widget.matchid.Counter)+1;
                                    await TeamService().timestart(widget.team.ID, starts);
                                          await TeamService().timefinish(widget.team.ID, finishs);
                                          await TeamService().duration(widget.team.ID, dur);
                                          await MatchService().joinchallenge(matchId , team);
                                  
                                   await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                                       widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                                   _fcm.subscribeToTopic(widget.matchid.Topic);
                                   _showSnackBar3();

                                }


                              }
                          ),

                          SizedBox(height: 20.0, width: 60,),
                          RaisedButton(
                              padding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                              color: Colors.blueAccent,
                              child: Text(
                                'Members',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: ()  {
                                gomember(widget.matchid);
                              }

                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],),
          ),
        ),
      ),

    );

    //                 FlatButton(
    //                child: Text('Book NOW'),
    //                  onPressed: () {
//                      )



  }}