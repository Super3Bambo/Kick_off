import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:getflutter/getflutter.dart';
import 'package:random_string_one/random_string.dart';
import 'package:intl/intl.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_icons/flutter_icons.dart';




class FieldDetailsowner extends StatefulWidget {
  final Field fieldid;
   final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];

  FieldDetailsowner({this.fieldid});





  @override
  _FieldDetailsownerState createState() => _FieldDetailsownerState();
}

class _FieldDetailsownerState extends State<FieldDetailsowner> {
  DateTime start, finish ;
  int diff,diff2;
     var showstart,showend;

  DateTime now=DateTime.now();
bool loading = false;

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

    
        List<String> startfield = List<String>();
    startfield = widget.fieldid.start_time.map((e) => e.Start_at).toList();
List<String> finishfield = List<String>();
    finishfield = widget.fieldid.finish_time.map((e) => e.Finish_at).toList();
List<String> durationfield = List<String>();
    durationfield = widget.fieldid.duration.map((e) => e.Duration).toList();

// List<String> startuser = List<String>();
//     startfield = widget.fieldid.start_time.map((e) => e.Start_at).toList();
// List<String> finishuser = List<String>();
//     finishfield = widget.fieldid.finish_time.map((e) => e.Finish_at).toList();
// List<String> durationuser = List<String>();
//     durationfield = widget.fieldid.duration.map((e) => e.Duration).toList();



DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
DateFormat timeFormat = DateFormat("HH:00:00:000");
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

          return  Scaffold (
             key: _scaffoldKey,
          appBar: AppBar(
            title: Text(durationfield.first),
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

                            // SizedBox(
                            //   height: 20.0,
                            // ),
                            // DateTimePickerFormField(
                            //   inputType: InputType.both,
                            //   format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
                            //   editable: false,
                            //   decoration: InputDecoration(
                            //       labelText: 'Start', hasFloatingPlaceholder: false),
                            //   onChanged: (dt) {
                            //     setState(() => start = dt);
                            //   },
                            // ),

                            // SizedBox(
                            //   height: 20.0,
                            // ),
                            // DateTimePickerFormField(
                            //   inputType: InputType.both,
                            //   format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
                            //   editable: false,
                            //   decoration: InputDecoration(
                            //       labelText: 'Finish', hasFloatingPlaceholder: false),
                            //   onChanged: (dt) {
                            //     setState(() => finish = dt);
                            //   },
                            // ),
                             Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 300.0,
                            ),
                            showTitleActions: true,
                          
                             onConfirm: (time) {
                         showstart = dateFormat.format(time).substring(0,16);
                          setState(() =>start=time );
                        }, 
                        currentTime: start??DateTime.now(), locale: LocaleType.en);
                       // setState(() =>start=date );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Colors.blue,
                                      ),
                                      Text(showstart==null?' select time':
                                        " $showstart",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                          "  Change",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 300.0,
                            ),
                            showTitleActions: true, onConfirm: (time) {
                         // print('confirm $time');
                         showend = dateFormat.format(time).substring(0,16);
                          setState(() =>finish=time );
                        }, currentTime:finish?? DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Colors.blue,
                                      ),
                                      Text( showend==null?' select time':" $showend",
                                       // " $_time",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                           Text(
                          "  Change",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
          ),

                            SizedBox(height: 20.0),
                            RaisedButton(
                                color: Colors.blue[700],
                                child: Text(
                                  'Book',
                                  style: TextStyle(color: Colors.white),
                                ),
                                
                                onPressed: () async {
                                var starttemp= widget.fieldid.Start_at;
                                var temp1 = starttemp.substring(0,2);
                                var parsethestart = int.tryParse(temp1);

                                 var endtemp =widget.fieldid.Finish_at;
                                  var temp2 = endtemp.substring(0,2);
                                  var parsetheEnd = int.tryParse(temp2);


                                 var getstart=timeFormat.format(start);
                                     var temp3 = getstart.substring(0,2);
                                     var parsemystart = int.tryParse(temp3);

                                   var getend=timeFormat.format(finish);
                                     var temp4 = getend.substring(0,2);
                                     var parsemyend = int.tryParse(temp4);

                                  // List<String> startuser = List<String>();
                                  //       startuser = userData.start_time.map((e) => e.Start_at).toList();
                                  // List<String> finishuser = List<String>();
                                  //       finishuser =userData.finish_time.map((e) => e.Finish_at).toList();
                                  // List<String> durationuser = List<String>();
                                  //        durationuser =userData.duration.map((e) => e.Duration).toList();


                                     var duration = start.add(new Duration(hours: 1));
                                     var duration2 = finish.subtract(new Duration(hours: 1));
                                      List<Field> dur=[
                                      Field(Duration:dateFormat.format(duration) ) ,
                                      Field(Duration: dateFormat.format(duration2))
                                      ];
                                      List<Field> starts=[
                                          Field(Start_at:dateFormat.format(start) )
                                        ];
                                        List<Field> finishs=[
                                          Field(Finish_at:dateFormat.format(finish) )
                                        ];

                                  if (start.isAfter(finish)) {
                                   //     Alert(context:  context, title: "Error",desc:'gg' ).show();
                                    penAlertBox_onebutton(   'Error' , 'Choose a resonable time');
 
                                    }
                                      else if(finish.difference(start).inHours>3){
                               //
                               //       Alert(context:  context, title: "Error",desc:'ffff' ).show();
                                    penAlertBox_onebutton(   'Error' , 'You can not book more than 3 hours');       }

                                    else if(start.isBefore(DateTime.now())){
                                 //     Alert(context:  context, title: "Error",desc:'nonon' ).show();
                                    penAlertBox_onebutton(   'Error' , 'Choose a resonable time');
                                      print(parsemyend);
                                      print(parsemystart);
                                      print(parsethestart);
                                      print(parsetheEnd);

                                    }
                                   
                                //     else if(finishuser.contains(dateFormat.format(start))||finishuser.contains(dateFormat.format(finish))||
                                //    finishuser.contains(dateFormat.format(duration))){
                                //         Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
 
                                //    }
                                    
                                //     else if(startuser.contains(dateFormat.format(start))||startuser.contains(dateFormat.format(finish))|| 
                                //     startuser.contains(dateFormat.format(duration))){
                                //                                         Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
 
                                //    }
                                //    else  if(durationuser.contains(dateFormat.format(start))||durationuser.contains(dateFormat.format(finish))|| 
                                //    durationuser.contains(dateFormat.format(duration))){
                                     
                                //         Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
 
                                //  }
                                   else  if(startfield.contains(dateFormat.format(start))||startfield.contains(dateFormat.format(finish))||
                                   startfield.contains(dateFormat.format(duration))){
                                      
                                       // Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'cc' ).show();
                                    penAlertBox_onebutton2(   'Error' , 'The field is not available in that time');
                                        
                                 }
                                   else  if(finishfield.contains(dateFormat.format(start))||finishfield.contains(dateFormat.format(finish))||
                                   finishfield.contains(dateFormat.format(duration)) ){
                                    
                                     //   Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'cc' ).show();
                                    penAlertBox_onebutton2(   'Error' , 'The field is not available in that time');
                                    }
                                   else if(durationfield.contains(dateFormat.format(start))||durationfield.contains(dateFormat.format(finish))||
                                   durationfield.contains(dateFormat.format(duration)) ){
                                                                    //   Alert(context: _scaffoldKey.currentContext, title: "Error",desc: 'cc', ).show();
                                    penAlertBox_onebutton2(   'Error' , 'The field is not available in that time');

                                  }
                                  else if(  (  !((parsethestart-parsemystart).isNegative) && (parsethestart-parsemystart)!=8) || (parsemystart==parsetheEnd) ){
                                    //     Alert(context: _scaffoldKey.currentContext, title: "Error",desc: 'str', ).show();
                                    penAlertBox_onebutton2(   'Error' , 'Choose a resonable time');

                                    print(parsemyend);
                                      print(parsemystart);
                                      print(parsethestart);
                                      print(parsetheEnd);
                                          
                                    }
                                     else if(((parsemyend-parsetheEnd)==1||(parsemyend-parsetheEnd)==2)){
                                                 //   Alert(context: _scaffoldKey.currentContext, title: "Error",desc: 'end', ).show();
                                    penAlertBox_onebutton2(   'Error' , 'Choose a resonable time');

                                    print(parsemyend);
                                      print(parsemystart);
                                      print(parsethestart);
                                      print(parsetheEnd);
                                          
                                    }
                                   else {
                                     print(parsemyend);
                                      print(parsemystart);
                                      print(parsethestart);
                                      print(parsetheEnd);
    // Subscribe the user to a topic  
                                    List<User>users=[];
                                     var s=dateFormat.format(start);
                                     var f= dateFormat.format(finish);
                                     var topic=  randomString(9, includeSymbols: false , includeNumbers: false , includeLowercase: false );
                                      _fcm.subscribeToTopic(topic);
                                      await MatchService().addMatchadmin(
                                        widget.fieldid.ID,
                                        widget.fieldid.Location,
                                        s,
                                        f,
                                        widget.fieldid.Price.toString(),
                                        users,
                                        topic
                                        );
                                        await FieldService().timestart(widget.fieldid.ID, starts);
                                        await FieldService().timefinish(widget.fieldid.ID, finishs);
                                        await FieldService().duration(widget.fieldid.ID, dur);
                                       // await UserService().timestart(userData.ID, starts);
                                       // await UserService().timefinish(userData.ID, finishs);
                                       // await UserService().duration(userData.ID, dur);
                                    // _showNotification();
                                    Navigator.pop(context);
                                 
                              }
                                }),
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

