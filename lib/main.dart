import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Home/myMatches.dart';
import 'package:flutter_app/screens/Matches/Match_Details_User.dart';
import './screens/warpper.dart';
import './Services/Auth.dart';
import './models/User.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_app/screens/Matches/Match_Details_Complete.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void main() => runApp(MyApp());
  

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
         // _showNotification();
         showDialog(
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
        );
 
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
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
                  // onPressed: () async {
                  //   Navigator.of(context, rootNavigator: true).pop();
                  //   await Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => Match_Details()));
                  // },
                )
              ],
            ));


    }

Future onSelectNotification(String payload)async{
if(payload!=null){
  debugPrint('Notification Payload : $payload');
}
//await Navigator.push(context, new MaterialPageRoute(builder: (context) =>new Match_Details()));
}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        
        home: Wrapper(),
        routes: {
         //   FieldDetails.routeName: (ctx) => FieldDetails(),
        // Match_Details.routeName:(ctx)=>Match_Details(),
        },
        
      ),
    );
    }
}