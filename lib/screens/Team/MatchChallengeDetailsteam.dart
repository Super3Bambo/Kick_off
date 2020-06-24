import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:getflutter/getflutter.dart';
import 'package:intl/intl.dart';



class MatchChallenge_Detailsteam extends StatefulWidget{

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
  MatchChallenge_Detailsteam({this.matchid,  this.team});


  @override
  _MatchChallenge_DetailsteamState createState() => _MatchChallenge_DetailsteamState();
}

class _MatchChallenge_DetailsteamState extends State<MatchChallenge_Detailsteam> {

  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");





  @override
  Widget build(BuildContext context) {


    List <Team> team=[
      Team(ID: widget.team.ID,),
    ];
    List<String> myList = List<String>();
    myList = widget.matchid.team.map((f)=>f.ID).toList();
    String matchId = widget.matchid.ID;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    _showSnackBar() {
      final snackBar = new SnackBar(
        content: new Text(" deleted match Done"),
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
                                'DisJoin',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {

                                 if(widget.matchid.Counter==1){

        var f=dateFormat.parse(widget.matchid.Check_in);
        var s=dateFormat.parse(widget.matchid.Check_out);
        var duration =f.add(new Duration(hours: 1));
        var duration2 = s.subtract(new Duration(hours: 1));


        List<Field> starts=[
        Field(Start_at:widget.matchid.Check_in )];
        List<Field> finishs=[
        Field(Finish_at:widget.matchid.Check_out )];
        List<Field> dur=[
        Field(Duration:dateFormat.format(duration) ),Field(Duration: dateFormat.format(duration2)) ];
        var count= (widget.matchid.Counter)-1;
        await MatchService().Disjoinchallenge(matchId , team);
        await FieldService().removetimestart(widget.matchid.Field, starts);
        await FieldService().removetimefinish(widget.matchid.Field, finishs);
        await FieldService().removeduration(widget.matchid.Field, dur);
        await TeamService().removetimestart(widget.team.ID, starts);
        await TeamService().removetimefinish(widget.team.ID, finishs);
        await TeamService().removeduration(widget.team.ID, dur);
        _fcm.unsubscribeFromTopic(widget.matchid.Topic);
        await MatchService().deleteMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
        widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                        _showSnackBar();



        
        
        
        }else{
          var f=dateFormat.parse(widget.matchid.Check_in);
        var s=dateFormat.parse(widget.matchid.Check_out);
        var duration =f.add(new Duration(hours: 1));
        var duration2 = s.subtract(new Duration(hours: 1));


        List<Field> starts=[
        Field(Start_at:widget.matchid.Check_in )];
        List<Field> finishs=[
        Field(Finish_at:widget.matchid.Check_out )];
        List<Field> dur=[
        Field(Duration:dateFormat.format(duration) ),Field(Duration: dateFormat.format(duration2)) ];
        var count= (widget.matchid.Counter)-1;
        await MatchService().Disjoinchallenge(matchId , team);
         await TeamService().removetimestart(widget.team.ID, starts);
        await TeamService().removetimefinish(widget.team.ID, finishs);
        await TeamService().removeduration(widget.team.ID, dur);
                _fcm.unsubscribeFromTopic(widget.matchid.Topic);
                 await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
        widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                _showSnackBar2();

        }
                                // if(myList.contains(widget.team.ID)){

                                //   _showSnackBar();



                                // }

                                // else if (widget.matchid.Counter==10) {
                                //   _showSnackBar2();
                                // }

                                // else{
                                //   var count= (widget.matchid.Counter)-1;
                                  
                                //   await MatchService().Disjoinchallenge(matchId , team);
                                //   await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                                //       widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                                //   _fcm.subscribeToTopic(widget.matchid.Topic);
                                //   _showSnackBar3();
                                // }


                              }
                          ),

                          // SizedBox(height: 20.0, width: 60,),
                          // RaisedButton(
                          //     padding: EdgeInsets.fromLTRB(20.0,10.0,20.0,10.0),
                          //     color: Colors.blueAccent,
                          //     child: Text(
                          //       'Members',
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //     onPressed: ()  {
                          //       gomember(widget.matchid);
                          //     }

                          // ),

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