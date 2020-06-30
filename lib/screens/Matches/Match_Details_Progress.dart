import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Payment.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../models/Matches.dart';
import '../../Services/Match.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import '../../Services/User.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:getflutter/getflutter.dart';
import 'package:intl/intl.dart';

import 'Members_OverView.dart';


class Match_DetailsProgress extends StatefulWidget{
  static const routeName = '/invite';
  
  final Match matchid; 
final List<String> imageList = [
  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
];
  Match_DetailsProgress({this.matchid});
   
 
  @override
  _Match_DetailsProgressState createState() => _Match_DetailsProgressState();
}

class _Match_DetailsProgressState extends State<Match_DetailsProgress> {

  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 DateFormat dateFormat14 = DateFormat("yyyy-MM-dd HH:mm:00:000");
DateTime temp =DateTime.now().add(Duration(hours: 4));

  @override
  Widget build(BuildContext context) {
 DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
    gomember(Match id) { Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesMemberOverview(matchid: widget.matchid)  ) );}

User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
  List<String> myList = List<String>();
    myList = widget.matchid.users.map((f)=>f.ID).toList();
    List<String> pendList = List<String>();
    pendList = widget.matchid.useres.map((f)=>f.ID).toList();
  String matchId = widget.matchid.ID;  
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
  _showSnackBar5() {
    final snackBar = new SnackBar(
        content: new Text("you need to pay"),
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
    _scaffoldKey.currentState.showSnackBar(snackBar); 
  }
return StreamBuilder<User>(
  //key: _scaffoldKey,
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          User userData = snapshot.data;
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

                            
                            new Column(
                           mainAxisAlignment:MainAxisAlignment.center,

                              children: <Widget>[
                                
                               // new Text(widget.matchid.Location),
                            
                                
                                
                           /*    ListView.builder(
                                  itemCount:myList.length,
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

                    SizedBox(height: 20.0,),
                            RaisedButton(
               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)
                              ),
                              padding: const EdgeInsets.all(0.0),
                              textColor: Colors.white,
                               // color: Colors.blue[700],
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius:BorderRadius.circular(20) ,
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    Color(0xFF0D47A1),
                                                    Color(0xFF42A5F5),
                                                  ],
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10.0),                                  
                                    child: Text(
                                    '                             Join Match                             ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                    onPressed: () async {
                      
                                  List<String> startuser = List<String>();
                                        startuser = userData.start_time.map((e) => e.Start_at).toList();
                                  List<String> finishuser = List<String>();
                                        finishuser =userData.finish_time.map((e) => e.Finish_at).toList();
                                  List<String> durationuser = List<String>();
                                         durationuser =userData.duration.map((e) => e.Duration).toList();
                                                    
                      if(myList.contains(user.ID)){
                
                _showSnackBar();

                

                    }
                    if(pendList.contains(user.ID)){
                
                _showSnackBar5();

                

                    }
                    
                  else if (widget.matchid.Counter==10) {
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

                                      if(finishuser.contains((widget.matchid.Check_in))||finishuser.contains(widget.matchid.Check_out)||
                                   finishuser.contains(durs)||finishuser.contains(durs2)){
                                        Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
 
                                   }
                                    
                                    else if(startuser.contains(widget.matchid.Check_in)||startuser.contains(widget.matchid.Check_out)|| 
                                    startuser.contains(durs) || startuser.contains(durs2)){
                                          Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
 
                                   }
                                   else  if(durationuser.contains(widget.matchid.Check_in)||durationuser.contains(widget.matchid.Check_out)|| 
                                   durationuser.contains(durs)||durationuser.contains(durs2)){
                                     
                                        Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();}
                                  else{
                                    var date =dateFormat14.format(temp);
                                       //  _showSnackBar3();
                                          // await UserService().timestart(user.ID, starts);
                                          // await UserService().timefinish(user.ID, finishs);
                                          // await UserService().duration(user.ID, dur);
                    var count= (widget.matchid.Counter);
                    await MatchService().joinMatchpay(matchId , users);
                    PaymentService().matchpay(user.ID, widget.matchid.ID, date);
                     await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
                       widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
                       _showSnackBar3();
                          
                        _fcm.subscribeToTopic(widget.matchid.Topic);
                      }}
                      
                      
                    }
                ),

                SizedBox(height: 20.0, width: 60,),
               RaisedButton(
               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)
                              ),
                              padding: const EdgeInsets.all(0.0),
                              textColor: Colors.white,
                               // color: Colors.blue[700],
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius:BorderRadius.circular(20) ,
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    Color(0xFF0D47A1),
                                                    Color(0xFF42A5F5),
                                                  ],
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10.0),                                  
                                    child: Text(
                                    '                              Members                              ',
                                    style: TextStyle(fontSize: 18),
                                  ),
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
 }else{return Loading();}
 }
 );
              



  }}