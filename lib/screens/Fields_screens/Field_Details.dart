/*import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Providers/FieldsProvider.dart';
import '../../Providers/MatchesProvider.dart';
import '../../models/User.dart';



class FieldDetails extends StatelessWidget{
  static const routeName = 'field-detail';
@override
  Widget build(BuildContext context) {
    final fieldId =
        ModalRoute.of(context).settings.arguments as String; // is the id!

    final loaddedfields = Provider.of<Fields>(context, listen: false,).findById(fieldId);
    final match = Provider.of<matches>(context ,  listen: false);
    final users = Provider.of<User> (context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loaddedfields.Name),
      ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ClipRRect(
                    child: Image(
                      image: AssetImage(loaddedfields.Photo_url),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(loaddedfields.Name,style: TextStyle(fontSize: 20.0),),
                        new SizedBox(height: 16.0),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(loaddedfields.Location),
                            new Text(loaddedfields.Price),
                          ],
                        ),
      //                 FlatButton(
    //                child: Text('Book NOW'),
  //                  onPressed: () {
//                      )
                    
                  

                      ],
                    ),
                  ),
             ]
                ,
              ),
            )
        )

    );


  }

}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/screens/Matches/Match_Details_Complete.dart';
import 'package:random_string_one/random_string.dart';
import '../../models/field.dart';
import '../../Services/Match.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class FieldDetails extends StatefulWidget {
  final Field fieldid;

  FieldDetails({this.fieldid});





  @override
  _FieldDetailsState createState() => _FieldDetailsState();
}

class _FieldDetailsState extends State<FieldDetails> {
  DateTime start, finish ;
  int diff,diff2;
  DateTime now=DateTime.now();
bool loading = false;


final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= new FlutterLocalNotificationsPlugin();
var initilizationSettingsAndroid;
var initilizationSettings;
var initilizationSettingsIOS;

void _showNotification()async{
await _demoNotification();
}

Future<void> _demoNotification()async{
 var androidPlateform= AndroidNotificationDetails('channel ID','channel name','chaneel Description',importance: Importance.Max,priority: Priority.High,ticker: 'text ticker');
 var iosPlateform=IOSNotificationDetails();
  var plateformChannel=NotificationDetails(androidPlateform,iosPlateform);
  await flutterLocalNotificationsPlugin.show(0, 'A new Match', 'Come and join us!', plateformChannel,payload: 'test payload');
}


  @override
  void initState() {
    super.initState();
    initilizationSettingsAndroid = new AndroidInitializationSettings('app_icon');
  initilizationSettings=new InitializationSettings(initilizationSettingsAndroid, initilizationSettingsIOS);
  initilizationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initilizationSettings = new InitializationSettings(
        initilizationSettingsAndroid, initilizationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initilizationSettings,
        onSelectNotification: onSelectNotification);

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
          _showNotification();

 
        print("onMessage: $message");
        // final snackbar = SnackBar(
        //   content: Text(message['notification']['title']),
        //   action: SnackBarAction(
        //     label: 'Go',
        //     onPressed: () => null,
        //   ),
        // );

        // Scaffold.of(context).showSnackBar(snackbar);
       /* showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: ListTile(
                  title: Text(message['notification']['title']),
                  subtitle: Text(message['notification']['body']),
                ),
                actions: <Widget>[
                  FlatButton(
                    color: Colors.amber,
                    child: Text('Ok'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
        );*/
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
  }

Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(body),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Ok'),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Match_Details()));
                  },
                )
              ],
            ));


    }
Future onSelectNotification(String payload)async{
if(payload!=null){
  debugPrint('Notification Payload : $payload');
}
await Navigator.push(context, new MaterialPageRoute(builder: (context) =>new Match_Details()));
}


  @override
  void dispose() {
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
        int sum = 0;
    widget.fieldid.rate.map((e) => e.Rate).forEach((int e){sum += e;});
      double count= sum/widget.fieldid.rate.length;
    User user = Provider.of<User>(context);
    List<User> users = [
      User(
        ID: user.ID,
      ),
    ];

    
        List<String> startfield = List<String>();
    startfield = widget.fieldid.start_time.map((e) => e.Start_at).toList();
List<String> finishfield = List<String>();
    finishfield = widget.fieldid.finish_time.map((e) => e.Finish_at).toList();
List<String> durationfield = List<String>();
    durationfield = widget.fieldid.duration.map((e) => e.Duration).toList();

List<String> startuser = List<String>();
    startfield = widget.fieldid.start_time.map((e) => e.Start_at).toList();
List<String> finishuser = List<String>();
    finishfield = widget.fieldid.finish_time.map((e) => e.Finish_at).toList();
List<String> durationuser = List<String>();
    durationfield = widget.fieldid.duration.map((e) => e.Duration).toList();



DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
    return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          User userData = snapshot.data;
          return loading? Loading(): Scaffold (
          appBar: AppBar(
            title: Text(durationfield.first),
          ),
          
          body: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new ClipRRect(
                  child: Image(
                    image: AssetImage('images/5omasy.jpg'),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: new Radius.circular(16.0),
                    topRight: new Radius.circular(16.0),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.all(16.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        widget.fieldid.Name,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      new SizedBox(height: 16.0),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(widget.fieldid.Location),
                          new Text(count.toStringAsFixed(2)),
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
                          color: Colors.pink[300],
                          child: Text(
                            'Book',
                            style: TextStyle(color: Colors.white),
                          ),
                          
                          onPressed: () async {
                            List<String> startuser = List<String>();
                                  startuser = userData.start_time.map((e) => e.Start_at).toList();
                            List<String> finishuser = List<String>();
                                  finishuser =userData.finish_time.map((e) => e.Finish_at).toList();
                            List<String> durationuser = List<String>();
                                   durationuser =userData.duration.map((e) => e.Duration).toList();


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
                              setState(() {
                                  Alert(context: context, title: "Error",desc:startuser.first ).show();
                              }); }
                             
                              else if(userData.start_time.contains(dateFormat.format(start))||userData.start_time.contains(dateFormat.format(finish))||
                              userData.start_time.contains(dateFormat.format(duration))){
                                 setState(() {
                                  Alert(context: context, title: "Error",desc: 'bb' ).show();
                              });}
                              
                              else if(userData.finish_time.contains(dateFormat.format(start))||userData.finish_time.contains(dateFormat.format(finish))|| 
                              userData.finish_time.contains(dateFormat.format(duration))){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'bb' ).show();
                              });}
                             else  if(userData.duration.contains(dateFormat.format(start))||userData.duration.map((e) => e.duration).contains(dateFormat.format(finish))|| 
                             userData.duration.contains(dateFormat.format(duration))){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'bb' ).show();
                              });}
                             else  if(startfield.contains(dateFormat.format(start))||startfield.contains(dateFormat.format(finish))||
                             startfield.contains(dateFormat.format(duration))){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'cc' ).show();
                              });}
                             else  if(finishfield.contains(dateFormat.format(start))||finishfield.contains(dateFormat.format(finish))||
                             finishfield.contains(dateFormat.format(duration)) ){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'cc' ).show();
                              });}
                             else   if(durationfield.contains(dateFormat.format(start))||durationfield.contains(dateFormat.format(finish))||
                             durationfield.contains(dateFormat.format(duration)) ){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'cc' ).show();
                              });}
                           
                             else {
    // Subscribe the user to a topic
                               var s=dateFormat.format(start);
                               var f= dateFormat.format(finish);
                               var topic=  randomString(9, includeSymbols: false , includeNumbers: false , includeLowercase: false );
                                _fcm.subscribeToTopic(topic);
                                await MatchService().addMatch(
                                  widget.fieldid.ID,
                                  widget.fieldid.Location,
                                  s,
                                  f,
                                  widget.fieldid.Price,
                                  users,
                                  topic
                                  );
                                  await FieldService().timestart(widget.fieldid.ID, starts);
                                  await FieldService().timefinish(widget.fieldid.ID, finishs);
                                  await FieldService().duration(widget.fieldid.ID, dur);
                                  await UserService().timestart(userData.ID, starts);
                                  await UserService().timefinish(userData.ID, finishs);
                                  await UserService().duration(userData.ID, dur);
                              Navigator.pop(context);
                           
                        }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          )
          )
          );}else{return Loading();}}
    );
  }
}

