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
import 'package:flutter_app/screens/Home/myMatches.dart';
import 'package:flutter_app/screens/Matches/Friends_Overview.dart';
import 'package:flutter_app/screens/Matches/Match_notfication.dart';
import '../../models/Matches.dart';
//import '../../Services/Match.dart';
//import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:getflutter/getflutter.dart';
import 'package:share/share.dart';
import 'Matches_Overview_User.dart';



class Match_Details extends StatefulWidget{
  static const routeName = '/backs';
  
  final Match matchid;
  final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];

  Match_Details({this.matchid});
 
  @override
  _Match_DetailsState createState() => _Match_DetailsState();
}

class _Match_DetailsState extends State<Match_Details> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final GlobalKey<ScaffoldState> _scaffoldKeys = new GlobalKey<ScaffoldState>();

  

  @override
  void initState() {
    super.initState();
  
  }

 
bool loading = false;


@override
  Widget build(BuildContext context) {

goback(){Navigator.pop(context);}
godetails(){
Navigator.push(context,MaterialPageRoute(builder: (context)=> FriendsOverview(match:widget.matchid)  ) );

}
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");

  String matchId = widget.matchid.ID;  
User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
_showSnackBar() {
    final snackBar = new SnackBar(
        content: new Text("you out of match Done"),
        duration: new Duration(seconds: 5),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back',
         onPressed: (){
           Navigator.pop(context);
        }),
    );
    _scaffoldKeys.currentState.showSnackBar(snackBar);
  }

  if (widget.matchid.Counter!=10) {/************************************************************ */

    
            return  Scaffold(
             key: _scaffoldKeys,
              appBar: AppBar(
              title: Text(user.ID),
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
                                      percent: widget.matchid.users.length.toDouble()/10,
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
                                       Text( widget.matchid.users.length.toString() + '' '/' '' '${10}',style: TextStyle(fontWeight: FontWeight.bold),),

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
                            'DisJoin',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if(widget.matchid.users.length>1){
                              
                                    var f=dateFormat.parse(widget.matchid.Check_in);
                                      var duration =f.add(new Duration(hours: 1));

                                           _showSnackBar();
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
                                 _fcm.unsubscribeFromTopic(widget.matchid.Topic);
                                 await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                               widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                               
                                  

                            }else{


                               


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
                                          await UserService().removetimestart(user.ID, starts);
                                          await UserService().removetimefinish(user.ID, finishs);
                                          await UserService().removeduration(user.ID, dur);
                              _fcm.unsubscribeFromTopic(widget.matchid.Topic);
                               await MatchService().deleteMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                               widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                             //  Duration(seconds:3,);
                           //  Future.delayed(Duration(seconds: 3),  goback());
                           
                                                                _showSnackBar();
                          }}
                          ),
                          
                          
                          
                                                  SizedBox(height: 20.0,width: 80,),

                           RaisedButton(
                              padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                          color: Colors.pink[300],
                          child: Text(
                            'Invite Friends',
                            style: TextStyle(color: Colors.white),
                          ),
                         
                            //Navigator.push(context, MaterialPageRoute(builder: (context) =>  FriendsOverview() ),);
                                        //godetails(widget.matchid);
                                     
                                     //   Navigator.of(context).pushNamed(demo.routeName,);

                                       onPressed:()=>godetails(),
                                  //      async{ !_isCreatingLink==false? null:await _createDynamicLink(true); 
                                  //        final RenderBox box = context.findRenderObject();
                                  //         _linkMessage  ==null? Loading(): 
                                  //          Share.share(_linkMessage,
                                  // subject: 'Hi I invite You To My Match ',
                                  // sharePositionOrigin:
                                  //     box.localToGlobal(Offset.zero) &
                                  //         box.size);
                                  //       }
                                      //  !_isCreatingLink
                                      //  ? () => _createDynamicLink(true): null, 
                                      // //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  Firebase_Messaging() ),);

                                       

                          
                          ),
                                    
                              ]),

                    //    InkWell(

                    //   child: Center(
                    //     child: Text(
                    //                    _linkMessage  ==null? '': _linkMessage+'/'+widget.matchid.ID.substring(5,13),
                    //       style: const TextStyle(color: Colors.blue),
                    //     ),
                    //   ),
                    //   onTap: () async {
                    //     if (_linkMessage != null) {
                    //       await launch(_linkMessage);
                    //     }

                    //   },
                    //   onLongPress: () {
                    //     Clipboard.setData(ClipboardData(text: _linkMessage));
                    //   },
                    // ),
                                    
                           ]) )
                    ]),
                                  ),
                  ),
                      ),
                        );
                        
              
 //),
    
       

  } else {/************************************************************************** */

     return  Scaffold(
   key: _scaffoldKeys,
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
                            if(widget.matchid.Counter>1){
                              
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
                                 _fcm.unsubscribeFromTopic(widget.matchid.Topic);
                                 await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                               widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                               
                                   _showSnackBar();

                            }else{


                               

                                  
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
                                          await UserService().removetimestart(user.ID, starts);
                                          await UserService().removetimefinish(user.ID, finishs);
                                          await UserService().removeduration(user.ID, dur);
                              _fcm.unsubscribeFromTopic(widget.matchid.Topic);
                               await MatchService().deleteMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                               widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                              _showSnackBar();
                          }}
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