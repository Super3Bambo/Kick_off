import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/models/field.dart';
import 'package:random_string_one/random_string.dart';
import '../../models/Matches.dart';
//import '../../Services/Match.dart';
//import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:getflutter/getflutter.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class MatchBoardDetails extends StatefulWidget{
  final Field fieldid;

  final Match matchid;
 

  MatchBoardDetails({this.matchid, this.fieldid});

  @override
  _MatchBoardDetailsState createState() => _MatchBoardDetailsState();
}

class _MatchBoardDetailsState extends State<MatchBoardDetails> {


  DateTime start, finish ;
  int diff,diff2;
  DateTime now=DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");


  @override
  Widget build(BuildContext context) {
    
 List<String> imageList = List<String>();
    imageList = widget.fieldid.images;


    return Scaffold(
        appBar: AppBar(
          title: Text(widget.matchid.ID),
        ),


        body: Container(
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
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
                                  child:RaisedButton(
    padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
    color: Colors.pink[300],
    child: Text(
    'Delete Match',
    style: TextStyle(color: Colors.white),
    ),
    onPressed: ()async  {
    var s=dateFormat.format(start);
    var f= dateFormat.format(finish);
    var topic=  randomString(9, includeSymbols: false , includeNumbers: false , includeLowercase: false );
/*await MatchService().deleteMatch(widget.matchid.ID,widget.fieldid.ID,now,
    widget.fieldid.Location,
    s,
    f,
    widget.fieldid.Price,
    widget.matchid.Counter,
    topic) ;*/
    Navigator.pop(context);

    }
    ),),],),

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


                                /* new Row(
                         mainAxisAlignment:MainAxisAlignment.center,

                            children: <Widget>[*/



                                //                 FlatButton(
                                //                child: Text('Book NOW'),
                                //                  onPressed: () {
//                      )


                              ]
                          )
                      )
                    ]
                )

            )
        )
    );

  }}