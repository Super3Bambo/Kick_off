import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Home/myMatches.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Progress.dart';
import 'package:flutter_app/screens/User/Edit_User.dart';
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

void _showNotification()async{
await _demoNotification();
}

Future<void> _demoNotification()async{
 var androidPlateform= AndroidNotificationDetails('channel ID','channel name','chaneel Description',importance: Importance.Max,priority: Priority.High,ticker: 'text ticker');
 var iosPlateform=IOSNotificationDetails();
  var plateformChannel=NotificationDetails(androidPlateform,iosPlateform);
  await flutterLocalNotificationsPlugin.show(0, 'A new Match', 'Come and join us!', plateformChannel, payload: 'test payload');
  
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
         print("onMessage: $message");
        _showNotification();
 
        
      //  // _navigateToItemDetail(message);
      // // Navigator.of(context).pushNamed(message['screen']);
      // var pagechooser= message['data'];
      // var view = pagechooser['screen'];
      // if(view!=null){
      //   Navigator.push(context,MaterialPageRoute(builder: (context)=> Edituser()  ) );
      // }
            //await  Navigator.push(context,MaterialPageRoute(builder: (context)=> Matches()  ) );

      },
      onLaunch: (Map<String, dynamic> message) async {
       // await Navigator.push(context,MaterialPageRoute(builder: (context)=> Matches()  ) );
       print("onLaunch: $message");
        navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => Edituser())
  );
      //  // Navigator.of(context).pushNamed(message['screen']);
      //   var pagechooser= message['screen'];
      //         var view = pagechooser['screen'];

      // if(view!=null){
     // await   Navigator.push(context,MaterialPageRoute(builder: (context)=> Edituser()  ) );
      // }
      //   //_navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
             //  await Navigator.push(context,MaterialPageRoute(builder: (context)=> Matches()  ) );

         print("onResume: $message");
          navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => Edituser())
  );
      //  // Navigator.of(context).pushNamed(message['screen']);
      //    var pagechooser= message['screen'];
      //          var view = pagechooser['screen'];

      // if(view!=null){
      //await  Navigator.push(context,MaterialPageRoute(builder: (context)=> Edituser()  ) );
      // }
      //   //_navigateToItemDetail(message);
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
    debugPrint('HELLO');

    //Navigator.push(context,MaterialPageRoute(builder: (context)=> Matches()  ) );
    navigatorKey.currentState.push(
    MaterialPageRoute(builder: (_) => Edituser())
  );
  
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