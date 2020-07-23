import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Home/homepage.dart';
import 'package:flutter_app/screens/Home/myMatches.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Progress.dart';
import 'package:flutter_app/screens/User/Edit_User.dart';
import 'package:flutter_app/screens/User/FollowersOverView.dart';
import './screens/warpper.dart';
import './Services/Auth.dart';
import './models/User.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


void main() => runApp(MyApp());
  

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "Main Navigator");
  final FirebaseMessaging _fcm = FirebaseMessaging();
  void _navigateToItemDetail(Map<String, dynamic> message) {
 String pagechooser= message['status'];
  Navigator.pushNamed(context, pagechooser);
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= new FlutterLocalNotificationsPlugin();


var initilizationSettingsAndroid;

var initilizationSettings;

var initilizationSettingsIOS; 

void _showNotification(Map<String, dynamic> message)async{
await _demoNotification(message);
var tt=message['notification']['title'];
print("$tt");
print("$message");
               String topic= message['data']['value2'];

 if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }
}

Future<void> _demoNotification(Map<String, dynamic> message)async{
 var androidPlateform= AndroidNotificationDetails('channel ID','channel name','chaneel Description',importance: Importance.Max,priority: Priority.High,ticker: 'text ticker');
 var iosPlateform=IOSNotificationDetails();
  var plateformChannel=NotificationDetails(androidPlateform,iosPlateform);
  await flutterLocalNotificationsPlugin.show(0, message['notification']['title'], message['notification']['body'], plateformChannel, payload: message['data']['value']);
  
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
         //print("onMessage: $message");
        _showNotification(message);
               String topic= message['data']['value2'];
                if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }

 
   
      },
      onLaunch: (Map<String, dynamic> message) async {
       print("onLaunch: $message");
       String pagechooser= message['data']['value'];
       String topic= message['data']['value2'];
       if(pagechooser=='usermatch'){
         navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => HomePage(2,1)));
    if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }
       
       }
       else if(pagechooser=='League'||pagechooser=='team'){

          navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => HomePage(3,null)));
    if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }
       }

       else if(pagechooser=='followers'){
     navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) =>FollowersOverview()));
    if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }
         
       }

       else if(pagechooser=='invite'){
          navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) =>HomePage(4,null)));
    if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }

       }
       
       
       
       else{}
      },
      onResume: (Map<String, dynamic> message) async {
             //  await Navigator.push(context,MaterialPageRoute(builder: (context)=> Matches()  ) );

         print("onResume: $message");
                 String pagechooser= message['data']['value'];
       String topic= message['data']['value2'];
       if(pagechooser=='usermatch'){
         navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => HomePage(2,1)));
    if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }
       
       }
       else if(pagechooser=='League'||pagechooser=='team'){

          navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => HomePage(3,null)));
    if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }
       }

       else if(pagechooser=='followers'){
     navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) =>FollowersOverview()));
    if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }
         
       }

       else if(pagechooser=='invite'){
          navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) =>HomePage(4,null)));
    if(topic!=null||topic.isNotEmpty){
     await _fcm.subscribeToTopic(topic);
    }

       }
       
       
       
       else{}
      
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
  //debugPrint('Notification Payload : $payload');
    debugPrint(payload);

    //Navigator.push(context,MaterialPageRoute(builder: (context)=> Matches()  ) );
  //   navigatorKey.currentState.push(
  //   MaterialPageRoute(builder: (_) => Edituser())
  // );
   String pagechooser= payload;

  //         navigatorKey.currentState.push(
  //   MaterialPageRoute(builder: (_) => Edituser())
  // );
       if(pagechooser=='usermatch'){
         navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => HomePage(2,1)));
   
       
       }
       else if(pagechooser=='League'||pagechooser=='team'){

          navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => HomePage(3,null)));
    
       }

       else if(pagechooser=='followers'){
     navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) =>FollowersOverview()));
   
         
       }

       else if(pagechooser=='invite'){
          navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) =>HomePage(4,null)));
    

       }
       
       
       
       else{}
  
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
        navigatorKey: navigatorKey,
        
        home: Wrapper(),
      ),
    );
    }
}