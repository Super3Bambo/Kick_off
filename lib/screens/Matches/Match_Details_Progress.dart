import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/Payment.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/field.dart';
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
    List<String> tempmember=[];
 DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
    gomember(Match id) { Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesMemberOverview(matchid: widget.matchid)  ) );}

User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
  List<String> myList = List<String>();
    myList = widget.matchid.users.map((f)=>f.ID).toList();
    List<String> pendList = List<String>();
    widget.matchid.useres==null? pendList=null:pendList = widget.matchid.useres.map((f)=>f.ID).toList();
  String matchId = widget.matchid.ID;  

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
        content: new Text("You need to pay"),
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
        content: new Text("The match is Complete"),
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
        content: new Text("You joined the match successfully!"),
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
          return StreamBuilder<Field>(
      stream: FieldService(fieldid: widget.matchid.Field).fieldd,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Field fieldData = snapshot.data;
          
List<String> imageList = List<String>();
    imageList = fieldData.images; 
    
    return  Scaffold(
   
   key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Match'),
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
                                items: imageList.map(
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
                    else if(pendList!=null){
                   if(pendList.contains(user.ID)){
                
                _showSnackBar5();

                

                    }}
                    
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
                                      //  Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
                                        penAlertBox_onebutton2(   'Error' , 'You have a match in the same time');
 
                                   }
                                    
                                    else if(startuser.contains(widget.matchid.Check_in)||startuser.contains(widget.matchid.Check_out)|| 
                                    startuser.contains(durs) || startuser.contains(durs2)){
                                         // Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
                                        penAlertBox_onebutton2(   'Error' , 'You have a match in the same time');


                                      }
                                   else  if(durationuser.contains(widget.matchid.Check_in)||durationuser.contains(widget.matchid.Check_out)|| 
                                   durationuser.contains(durs)||durationuser.contains(durs2)){
                                     
                                    //    Alert(context:  _scaffoldKey.currentContext, title: "Error",desc: 'bb' ).show();
                                    //
                                        penAlertBox_onebutton2(   'Error' , 'You have a match in the same time');
                                      }
                                      else if(tempmember.contains(user.ID)){
                                        penAlertBox_onebutton2(   'Alert' , 'You Should pay to join match check Notification');
                                      }
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
                          
                        await _fcm.subscribeToTopic(widget.matchid.Topic);
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
 }else{return Loading();}
 }
 );
              



  }}