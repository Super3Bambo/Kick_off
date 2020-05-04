import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/screens/Matches/Friends_Overview.dart';
import 'package:flutter_app/screens/Matches/Match_notfication.dart';
import '../../models/Matches.dart';
//import '../../Services/Match.dart';
//import '../../models/User.dart';
import 'package:provider/provider.dart';
import './test2.dart';
import 'dart:async';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';



class Match_Details extends StatefulWidget{
  
  final Match matchid;

  Match_Details({this.matchid});
 
  @override
  _Match_DetailsState createState() => _Match_DetailsState();
}

class _Match_DetailsState extends State<Match_Details> {
    //final FirebaseMessaging _fcm=FirebaseMessaging();

String _linkMessage;
  bool _isCreatingLink = false;
  String _testString =
      "To test: long press link and then copy and click from a non-browser "
      "app. Make sure this isn't being tested on iOS simulator and iOS xcode "
      "is properly setup. Look at firebase_dynamic_links/README.md for more "
      "details.";


  @override
  void initState() {
    super.initState();
    initDynamicLinks();
   // _fcm.getToken().then((token){
//print ("The token ID is "+ token);

  //  });

  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    
  }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          if (deepLink != null) {
            Navigator.pushNamed(context, deepLink.path);
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  Future<void> _createDynamicLink(bool short) async {
    setState(() {
      _isCreatingLink = true;
    });

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://kickoff3.page.link',
      link: Uri.parse('https://kickoff3.page.link/invite'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.kick_off',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.google.FirebaseCppDynamicLinksTestApp.dev',
        minimumVersion: '0',
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }

    setState(() {
      _linkMessage = url.toString();
      _isCreatingLink = false;
    });
  }





 

bool loading = false;


@override
  Widget build(BuildContext context) {

godetails(Match id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> FriendsOverview()  ) );

}
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String matchId = widget.matchid.ID;  
User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
_showSnackBar() {
    final snackBar = new SnackBar(
        content: new Text("you out of match Done"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back',
         onPressed: (){
           Navigator.pop(context);
        }),
    );
    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  if (widget.matchid.Counter!=10) {/************************************************************ */

    
            return  Scaffold(  
             key: _scaffoldKey,
              appBar: AppBar(
              title: Text(widget.matchid.ID),
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
                              new Text(widget.matchid.Date.toDate().toString(),style: TextStyle(fontSize: 20.0),),
                              new SizedBox(height: 16.0),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Text(widget.matchid.Location),
                                  new Text(widget.matchid.Counter.toString()),
                                  
                                 /* ListView.builder(
                                    itemCount: widget.matchid.users.length,
                                     itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                         child: Card(
                                            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                                             child: ListTile( 
                                             title: Text('fds'),
                                              subtitle: Text('dfs',
              ),
          ),
    )
    );
                                     }),*/


                                      SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.pink[300],
                      child: Text(
                        'DisJoin',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {




                              
                                var f=dateFormat.parse(widget.matchid.Check_in);
                                  var duration =f.add(new Duration(hours: 1));


                                       List<Field> starts=[
                                    Field(Start_at:widget.matchid.Check_in )];
                                      List<Field> finishs=[
                                    Field(Finish_at:widget.matchid.Check_out )];
                                     List<Field> dur=[
                                Field(Duration:dateFormat.format(duration) ) ];


                          var count= (widget.matchid.Counter)-1;
                         await MatchService().disjoinMatch(matchId , users);
                                     await FieldService().removetimestart(widget.matchid.Field, starts);
                                      await FieldService().removetimefinish(widget.matchid.Field, finishs);
                                      await FieldService().removeduration(widget.matchid.Field, dur);
                                      await UserService().removetimestart(user.ID, starts);
                                      await UserService().removetimefinish(user.ID, finishs);
                                      await UserService().removeduration(user.ID, dur);
                           await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                           widget.matchid.Check_out , widget.matchid.Price, count);
                          _showSnackBar();
                      }
                      ),
                      
                      
                      
                      
                       RaisedButton(
                      color: Colors.pink[300],
                      child: Text(
                        'Invite Friends',
                        style: TextStyle(color: Colors.white),
                      ),
                     
                        //Navigator.push(context, MaterialPageRoute(builder: (context) =>  FriendsOverview() ),);
                                    //godetails(widget.matchid);
                                 
                                 //   Navigator.of(context).pushNamed(demo.routeName,);

                                   onPressed:(){ //!_isCreatingLink
                                   //? () => _createDynamicLink(true): null,
                                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Firebase_Messaging() ),);

                                   }

                      
                      ),
                                ]),
                        

                   InkWell(

                  child: Center(
                    child: Text(
                                   _linkMessage ?? '',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                  onTap: () async {
                    if (_linkMessage != null) {
                      await launch(_linkMessage);
                    }

                  },
                  onLongPress: () {
                    Clipboard.setData(ClipboardData(text: _linkMessage));
                  },
                ),
                                
                            ]
                              ),
                              ),
                      ],),
                      ),
                      ),
 //),
    
       );

  } else {/************************************************************************** */

     return  Scaffold(
   key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.matchid.ID),
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
                        new Text(widget.matchid.Date.toDate().toString(),style: TextStyle(fontSize: 20.0),),
                        new SizedBox(height: 16.0),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(widget.matchid.Location),
                            new Text(widget.matchid.Counter.toString()),
                            
                           /* ListView.builder(
                              itemCount: widget.matchid.users.length,
                               itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                   child: Card(
                                      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                                       child: ListTile( 
                                       title: Text('fds'),
                                        subtitle: Text('dfs',
        ),
      ),
    )
    );
                               }),*/


                                SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[300],
                child: Text(
                  'DisJoin',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                   
                    var count= (widget.matchid.Counter)-1;
                   await MatchService().disjoinMatch(matchId , users);
                     await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                     widget.matchid.Check_out , widget.matchid.Price, count);
                    _showSnackBar();
                }
                )
                          ],
                        ),
                        ],
                        ),
                        ),
                ],),
                ),
                ),
 );
  }


              
      //                 FlatButton(
    //                child: Text('Book NOW'),
  //                  onPressed: () {
//                      )



  }}