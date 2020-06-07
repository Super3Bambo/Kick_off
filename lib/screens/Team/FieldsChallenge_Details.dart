import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/models/team.dart';
import '../../models/field.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:getflutter/getflutter.dart';
import 'package:random_string_one/random_string.dart';
import '../../Services/Match.dart';
import 'package:flutter_icons/flutter_icons.dart';


class FieldDetailsTeam extends StatefulWidget {
  
  
  final Field fieldid;
final Team teamid;
  FieldDetailsTeam({this.fieldid,this.teamid});
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  @override
  _FieldDetailsTeamState createState() => _FieldDetailsTeamState();
}

class _FieldDetailsTeamState extends State<FieldDetailsTeam> {
  DateTime start, finish = DateTime.now();
  int diff,diff2;
  DateTime now=DateTime.now();
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final Firestore _db = Firestore.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    int sum = 0;
    widget.fieldid.rate.map((e) => e.Rate).forEach((int e){sum += e;});
    double count= sum/widget.fieldid.rate.length;
    // User user = Provider.of<User>(context);
    // List<User> users = [
    //   User(
    //     ID: user.ID,
    //   ),
    // ];
    List<Team> teams=[
      Team(
        ID: widget.teamid.ID,
      ),
    ];


     List<String> startfield = List<String>();
     startfield = widget.fieldid.start_time.map((e) => e.Start_at).toList();
     List<String> finishfield = List<String>();
     finishfield = widget.fieldid.finish_time.map((e) => e.Finish_at).toList();
     List<String> durationfield = List<String>();
     durationfield = widget.fieldid.duration.map((e) => e.Duration).toList();

                                              List<String> startusers = List<String>();
                                               startusers = widget.teamid.start_time.map((e) => e.Start_at).toList();
                                               List<String> finishuser = List<String>();
                                               finishuser =widget.teamid.finish_time.map((e) => e.Finish_at).toList();
                                               List<String> durationuser = List<String>();
                                               durationuser =widget.teamid.duration.map((e) => e.Duration).toList();
      
    // List<String> startuser = List<String>();
    // startfield = widget.fieldid.start_time.map((e) => e.Start_at).toList();
    // List<String> finishuser = List<String>();
    // finishfield = widget.fieldid.finish_time.map((e) => e.Finish_at).toList();
    // List<String> durationuser = List<String>();
    // durationfield = widget.fieldid.duration.map((e) => e.Duration).toList();



    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
   
            return  Scaffold (
                key: _scaffoldKey,
                appBar: AppBar(
                  title: Text(startusers.last),
                ),

                body: Container(
                  child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ClipRRect(
                              child:GFCarousel(
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
                                              Icon(FontAwesome.star, size: 20, color: Colors.yellow[800],),),
                                            Container(
                                              margin: EdgeInsets.only(left:110 ,top: 10),
                                              child: Text(count.floor().toString() ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                            )



                                          ],),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.start,

                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top:10,),
                                              child: Icon( FontAwesome.location_arrow , size: 20, color: Colors.blue,) ,/*Icon( FontAwesome.location_arrow , size: 20, color: Colors.blue,)*/ ),

                                            Container(
                                              margin: EdgeInsets.only(left:110, top: 10),
                                              child: Text(widget.fieldid.Location ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                            )


                                          ],),


                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:MainAxisAlignment.start,

                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top:10,),
                                              child: Icon(FontAwesome.newspaper_o , size: 20, color: Colors.blue,),),
                                            Container(
                                              margin: EdgeInsets.only(left:110, top: 10),
                                              child: Text(widget.fieldid.Name ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                            )


                                          ],),

                                        Container(
                                          margin: EdgeInsets.only(top:25,bottom: 10) ,
                                          child:Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            mainAxisSize:MainAxisSize.max,
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Icon(FontAwesome.bath , size: 30, color: widget.fieldid.Bathroom? Colors.green[900]: Colors.grey[700],),
                                              Icon(Ionicons.md_football ,size: 30,color: widget.fieldid.Ball? Colors.green[900]: Colors.grey[700],),
                                              Icon(MaterialIcons.person_outline, size: 30,color: widget.fieldid.Refree? Colors.green[900]: Colors.grey[700],),
                                              // IconToggle(value: true ,activeColor: Colors.yellow,),
                                            ],

                                          ),),




                                        new SizedBox(height: 16.0),
                                        new Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[

                                          ],
                                        ),
                                        //                 FlatButton(
                                        //                child: Text('Book NOW'),
                                        //                  onPressed: () {
//                      )

                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        DateTimePickerFormField(
                                          inputType: InputType.both,
                                          format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
                                          editable: false,
                                          decoration: InputDecoration(
                                              labelText: 'Start', hasFloatingPlaceholder: false),
                                          onChanged: (dt) {
                                            setState(() => start = dt);
                                          },
                                        ),

                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        DateTimePickerFormField(
                                          inputType: InputType.both,
                                          format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
                                          editable: false,
                                          decoration: InputDecoration(
                                              labelText: 'Finish', hasFloatingPlaceholder: false),
                                          onChanged: (dt) {
                                            setState(() => finish = dt);
                                          },
                                        ),

                                        SizedBox(height: 20.0),
                                        RaisedButton(
                                            color: Colors.blue[700],
                                            child: Text(
                                              'Book',
                                              style: TextStyle(color: Colors.white),
                                            ),

                                            onPressed: () async {
                                              


                                              var duration = start.add(new Duration(hours: 1));
                                              List<Field> dur=[
                                                Field(Duration:dateFormat.format(duration) ) ];
                                              List<Field> starts=[
                                                Field(Start_at:dateFormat.format(start) )
                                              ];
                                              List<Field> finishs=[
                                                Field(Finish_at:dateFormat.format(finish) )
                                              ];

                                              if (start.isAfter(finish)) {
                                                Alert(context:  context, title: "Error",desc:'dsds' ).show();

                                              }

                                              else if(startfield.contains(dateFormat.format(start))||startfield.contains(dateFormat.format(finish))||
                                                  startfield.contains(dateFormat.format(duration))){
                                                Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'b' ).show();

                                              }

                                              else if(finishfield.contains(dateFormat.format(start))||finishfield.contains(dateFormat.format(finish))||
                                                  finishfield.contains(dateFormat.format(duration))){
                                                Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();

                                              }
                                              else  if(durationfield.contains(dateFormat.format(start))||durationfield.contains(dateFormat.format(finish))||
                                                durationfield.contains(dateFormat.format(duration))){

                                                Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bbb' ).show();

                                              }
                                              else  if(startusers.contains(dateFormat.format(start))||startusers.contains(dateFormat.format(finish))||
                                                  startusers.contains(dateFormat.format(duration))){

                                                Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'c' ).show();


                                              }
                                              else  if( durationuser.contains(dateFormat.format(start))||durationuser.contains(dateFormat.format(finish))||
                                               durationuser.contains(dateFormat.format(duration)) ){

                                                Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'cc' ).show();

                                              }
                                              else   if(  finishuser.contains(dateFormat.format(start))||  finishuser.contains(dateFormat.format(finish))||
                                                   finishuser.contains(dateFormat.format(duration)) ){
                                                Alert(context: _scaffoldKey.currentContext, title: "Error",desc: 'ccb', ).show();

                                              }

                                              else {
                                                // Subscribe the user to a topic
                                                 var startime=dateFormat.format(start);
                                                 var finishtime= dateFormat.format(finish);
                                                 var topic=  randomString(9, includeSymbols: false , includeNumbers: false , includeLowercase: false );
                                                 _fcm.subscribeToTopic(topic);
                                                 await MatchService().addChallenge(
                                                     widget.fieldid.ID,
                                                     widget.fieldid.Location,
                                                     startime,
                                                     finishtime,
                                                     widget.fieldid.Price,
                                                     teams,
                                                      topic
                                                 );
                                                 await FieldService().timestart(widget.fieldid.ID, starts);
                                                 await FieldService().timefinish(widget.fieldid.ID, finishs);
                                                 await FieldService().duration(widget.fieldid.ID, dur);
                                                 await TeamService().timestart(widget.teamid.ID, starts);
                                                 await TeamService().timefinish(widget.teamid.ID, finishs);
                                                 await TeamService().duration(widget.teamid.ID, dur);
                                                  Navigator.pop(context);

                                              }
                                            }
                                            ),
                                      ],
                                    ),
                                  ]),
                            )],
                        ),
                      )
                  ),
                )
            );
  }
}
