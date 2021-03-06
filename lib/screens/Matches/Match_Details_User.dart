import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/screens/Matches/Friends_Overview.dart';
import '../../models/Matches.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:getflutter/getflutter.dart';



class Match_Details extends StatefulWidget{
  static const routeName = '/backs';
  
  final Match matchid;
  

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

// Disjoin()
//   async {
//     if(widget.matchid.Counter>1){

//       var f=dateFormat.parse(widget.matchid.Check_in);
//       var duration =f.add(new Duration(hours: 1));


//       List<Field> starts=[
//         Field(Start_at:widget.matchid.Check_in )];
//       List<Field> finishs=[
//         Field(Finish_at:widget.matchid.Check_out )];
//       List<Field> dur=[
//         Field(Duration:dateFormat.format(duration) ) ];
//       var count= (widget.matchid.Counter)-1;
//       await MatchService().disjoinMatch(matchId , users);
//       await FieldService().removetimestart(widget.matchid.Field, starts);
//       await FieldService().removetimefinish(widget.matchid.Field, finishs);
//       await FieldService().removeduration(widget.matchid.Field, dur);
//       await UserService().removetimestart(user.ID, starts);
//       await UserService().removetimefinish(user.ID, finishs);
//       await UserService().removeduration(user.ID, dur);
//       _fcm.unsubscribeFromTopic(widget.matchid.Topic);
//       await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
//           widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);

//       _showSnackBar();

//     }else{





//       var f=dateFormat.parse(widget.matchid.Check_in);
//       var duration =f.add(new Duration(hours: 1));


//       List<Field> starts=[
//         Field(Start_at:widget.matchid.Check_in )];
//       List<Field> finishs=[
//         Field(Finish_at:widget.matchid.Check_out )];
//       List<Field> dur=[
//         Field(Duration:dateFormat.format(duration) ) ];


//       var count= (widget.matchid.Counter)-1;
//       await MatchService().disjoinMatch(matchId , users);
//       await UserService().removetimestart(user.ID, starts);
//       await UserService().removetimefinish(user.ID, finishs);
//       await UserService().removeduration(user.ID, dur);
//       _fcm.unsubscribeFromTopic(widget.matchid.Topic);
//       await MatchService().deleteMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
//           widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
//       _showSnackBar();
//     }
// }
// Disjoin2() async{
// if(widget.matchid.Counter>1){

//   var f=dateFormat.parse(widget.matchid.Check_in);
//   var duration =f.add(new Duration(hours: 1));


//   List<Field> starts=[
//     Field(Start_at:widget.matchid.Check_in )];
//   List<Field> finishs=[
//     Field(Finish_at:widget.matchid.Check_out )];
//   List<Field> dur=[
//     Field(Duration:dateFormat.format(duration) ) ];
//   var count= (widget.matchid.Counter)-1;
//   await MatchService().disjoinMatch(matchId , users);
//   await FieldService().removetimestart(widget.matchid.Field, starts);
//   await FieldService().removetimefinish(widget.matchid.Field, finishs);
//   await FieldService().removeduration(widget.matchid.Field, dur);
//   await UserService().removetimestart(user.ID, starts);
//   await UserService().removetimefinish(user.ID, finishs);
//   await UserService().removeduration(user.ID, dur);
//   _fcm.unsubscribeFromTopic(widget.matchid.Topic);
//   await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
//       widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);

//   _showSnackBar();

// }else{





//   var f=dateFormat.parse(widget.matchid.Check_in);
//   var duration =f.add(new Duration(hours: 1));


//   List<Field> starts=[
//     Field(Start_at:widget.matchid.Check_in )];
//   List<Field> finishs=[
//     Field(Finish_at:widget.matchid.Check_out )];
//   List<Field> dur=[
//     Field(Duration:dateFormat.format(duration) ) ];


//   var count= (widget.matchid.Counter)-1;
//   await MatchService().disjoinMatch(matchId , users);
//   await UserService().removetimestart(user.ID, starts);
//   await UserService().removetimefinish(user.ID, finishs);
//   await UserService().removeduration(user.ID, dur);
//   _fcm.unsubscribeFromTopic(widget.matchid.Topic);
//   await MatchService().deleteMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
//       widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
//   _showSnackBar();
// }}

openAlertBox_twobutton1(  String title , String content ) {
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Color(0xff00bfa5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            // bottomRight: Radius.circular(32.0)
                          ),
                        ),
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap:() async{
        if(widget.matchid.Counter==1){

        var f=dateFormat.parse(widget.matchid.Check_in);
        var s=dateFormat.parse(widget.matchid.Check_out);
        var duration =f.add(new Duration(hours: 1));
        var duration2 = s.subtract(new Duration(hours: 1));


        List<Field> starts=[
        Field(Start_at:widget.matchid.Check_in )];
        List<Field> finishs=[
        Field(Finish_at:widget.matchid.Check_out )];
        List<Field> dur=[
        Field(Duration:dateFormat.format(duration) ),Field(Duration: dateFormat.format(duration2)) ];
        var count= (widget.matchid.Counter)-1;
        await MatchService().disjoinMatch(matchId , users);
        await FieldService().removetimestart(widget.matchid.Field, starts);
        await FieldService().removetimefinish(widget.matchid.Field, finishs);
        await FieldService().removeduration(widget.matchid.Field, dur);
        await UserService().removetimestart(user.ID, starts);
        await UserService().removetimefinish(user.ID, finishs);
        await UserService().removeduration(user.ID, dur);
        _fcm.unsubscribeFromTopic(widget.matchid.Topic);
        await MatchService().deleteMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
        widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);

        _showSnackBar();

        }else{





        var f=dateFormat.parse(widget.matchid.Check_in);
        var duration =f.add(new Duration(hours: 1));
        var s=dateFormat.parse(widget.matchid.Check_out);
       var duration2 = s.subtract(new Duration(hours: 1));




        List<Field> starts=[
        Field(Start_at:widget.matchid.Check_in )];
        List<Field> finishs=[
        Field(Finish_at:widget.matchid.Check_out )];
        List<Field> dur=[
        Field(Duration:dateFormat.format(duration) ),Field(Duration: dateFormat.format(duration2)) ];


        var count= (widget.matchid.Counter)-1;
        await MatchService().disjoinMatch(matchId , users);
        await UserService().removetimestart(user.ID, starts);
        await UserService().removetimefinish(user.ID, finishs);
        await UserService().removeduration(user.ID, dur);
        _fcm.unsubscribeFromTopic(widget.matchid.Topic);
        await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in,
        widget.matchid.Check_out , widget.matchid.Price, count , widget.matchid.Topic);
        _showSnackBar();
        }
        Navigator.pop(context);
        },




                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      //color: Colors.red,
                      width: 4,
                    ),

                    InkWell(
                      child: Container(

                        width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Color(0xff00bfa5),
                          borderRadius: BorderRadius.only(
                            // bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: ()=>Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
  );
}


openAlertBox_twobutton2(  String title , String content ) {
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Color(0xff00bfa5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            // bottomRight: Radius.circular(32.0)
                          ),
                        ),
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap:() async{
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
                        }
                        Navigator.pop(context);},




                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      //color: Colors.red,
                      width: 4,
                    ),

                    InkWell(
                      child: Container(

                        width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Color(0xff00bfa5),
                          borderRadius: BorderRadius.only(
                            // bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: ()=>Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
  );
}


openAlertBox_twobutton3(  String title , String content ) {
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Color(0xff00bfa5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            // bottomRight: Radius.circular(32.0)
                          ),
                        ),
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap:() {godetails();
                        Navigator.pop(context);}

                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      //color: Colors.red,
                      width: 4,
                    ),

                    InkWell(
                      child: Container(

                        width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Color(0xff00bfa5),
                          borderRadius: BorderRadius.only(
                            // bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: ()=>Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
  );
}

  if (widget.matchid.Counter!=10) {
    
    /************************************************************ */

     return StreamBuilder<Field>(
      stream: FieldService(fieldid: widget.matchid.Field).fieldd,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Field fieldData = snapshot.data;
          
List<String> imageList = List<String>();
    imageList = fieldData.images; 
            return  Scaffold(
             key: _scaffoldKeys,
              appBar: AppBar(
              title: Text('Match'),
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
                           mainAxisAlignment:MainAxisAlignment.start,

                              children: <Widget>[

                          SizedBox(height: 20.0,width: 60,),
                         RaisedButton(
               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.redAccent)
                              ),
                              padding: const EdgeInsets.all(0.0),
                              textColor: Colors.white,
                               // color: Colors.blue[700],
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius:BorderRadius.circular(20) ,
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    // Color(0xFF0D47A1),
                                                    // Color(0xFF42A5F5),
                                                    Colors.red,
                                                    Colors.pink[700]
                                                  ],
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10.0),                                  
                                    child: Text(
                                    '                           DisJoin match                          ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                          onPressed: (){

   openAlertBox_twobutton1(  'Caution' , 'Are you sure you want to disjoin this match?'); }

                                /*    var f=dateFormat.parse(widget.matchid.Check_in);
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
                          }}*/
                          ),
                          
                          
                          
                                                  SizedBox(height: 20.0,width: 80,),

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
                                    '                            Invite Friends                           ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                         
                            //Navigator.push(context, MaterialPageRoute(builder: (context) =>  FriendsOverview() ),);
                                        //godetails(widget.matchid);
                                     
                                     //   Navigator.of(context).pushNamed(demo.routeName,);
                               onPressed: (){
                                 godetails();

                                 //openAlertBox_twobutton3(  'Caution' , 'Are you sure you want to invite friends to this match?');
                                  },
                                     /*  onPressed:()=>godetails(),*/
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
        }else{return Loading(); }});
                        
              
 //),
    
       

  } else {/************************************************************************** */

 return StreamBuilder<Field>(
      stream: FieldService(fieldid: widget.matchid.Field).fieldd,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Field fieldData = snapshot.data;
          
List<String> imageList = List<String>();
    imageList = fieldData.images; 
     return  Scaffold(
   key: _scaffoldKeys,
      appBar: AppBar(
        
        title: Text('Match'),
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
               widget.matchid.users.contains(user.ID)?RaisedButton(
               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.redAccent)
                              ),
                              padding: const EdgeInsets.all(0.0),
                              textColor: Colors.white,
                               // color: Colors.blue[700],
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius:BorderRadius.circular(20) ,
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    // Color(0xFF0D47A1),
                                                    // Color(0xFF42A5F5),
                                                    Colors.red,
                                                    Colors.pink[700]
                                                  ],
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10.0),                                  
                                    child: Text(
                                    '                           DisJoin match                          ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                  onPressed: (){

                    openAlertBox_twobutton2(  'Caution' , 'Are you sure you want to disjoin this match?'); }/*async {
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
                          }}*/
                ):Text('You Should Pay At Most 4 Hours')
                          ],
                        ),
                        ],
                        ),
                        ),
                ],),
                ),
                ),
 );
   }else{return Loading(); }});
  }


              
      //                 FlatButton(
    //                child: Text('Book NOW'),
  //                  onPressed: () {
//                      )



  }}