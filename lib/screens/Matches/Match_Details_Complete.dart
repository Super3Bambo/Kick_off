import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/field.dart';
import '../../models/Matches.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:getflutter/getflutter.dart';

class Match_Details extends StatefulWidget{
  
  final Match matchid;
  
  Match_Details({this.matchid});
 
  @override
  _Match_DetailsState createState() => _Match_DetailsState();
}

class _Match_DetailsState extends State<Match_Details> {


         


@override
  Widget build(BuildContext context) {

 return StreamBuilder<Field>(
      stream: FieldService(fieldid: widget.matchid.Field).fieldd,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Field fieldData = snapshot.data;
          
List<String> imageList = List<String>();
    imageList = fieldData.images; 

 return Scaffold(
      appBar: AppBar(
        title: Text('Match Completed'),
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
        }else{return Loading(); }});
                        
                        }}