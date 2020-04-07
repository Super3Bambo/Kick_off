import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/Matches/Members_OverView.dart';
import '../../models/Matches.dart';
import '../../Services/Match.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;


class Members_Details extends StatefulWidget{
  
  final User userid;

  Members_Details({this.userid});
   
 
  @override
  _Members_DetailsState createState() => _Members_DetailsState();
}

class _Members_DetailsState extends State<Members_Details> {


         


@override
  Widget build(BuildContext context) {



    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg';

 User user = Provider.of<User>(context);



    return  Scaffold(appBar: AppBar(title: Text(widget.userid.FName),),
          body: Stack(children: <Widget>[
            
         Container(color: Colors.blue,),
         Image.network(imgUrl, fit: BoxFit.fill,),
         BackdropFilter(
            filter:  ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child:  Container(
              decoration: BoxDecoration(
                
                color:  Colors.blue.withOpacity(0.9),
                //borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),)),
         Scaffold(
            drawer:  Drawer(child:  Container(),),
            backgroundColor: Colors.transparent,
            body:  Center(
              child:  Column(
                children: <Widget>[
                                       SizedBox(height: _height/12,),

                   InkWell(
                  //   onTap: ()=>getImage(),
                 child:  CircleAvatar(
                     
                      radius: 100,
                      child: ClipOval(
                     child: SizedBox(
                        width: 220.0,
                            height: 220.0,
                            
                    //backgroundImage: NetworkImage(imgUrl),
                   child: (widget.userid.Photo_url!=null)?Image.network(
                            /* --------------------*/  widget.userid.Photo_url,
                              fit: BoxFit.fill,
                            ):Image.network(
                              imgUrl,
                              fit: BoxFit.fill,
                            ),
                            
                   ),),),),

                    

                   SizedBox(height: _height/25.0,),
                   Text(widget.userid.FName + ' ' + '${ widget.userid.LName}', style:  TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                   Padding(padding:  EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                    child: Text('First Player to join the APP!',
                      style:  TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                   Divider(height: _height/30,color: Colors.white,),
                   Padding(padding:  EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){},
                    child:  Container(child:  Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                FlatButton.icon(
                icon: Icon(Icons.edit),
                label: Text('Follow'),
               onPressed: (){
                                /* Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => Edituser()));*/

                },
              ),           //new Icon(Icons.edit),
                      //new SizedBox(width: _width/30,),
                   //   new Text('Edit')
                    ],)),color: Colors.blue[50],),),
                   Divider(height: _height/30,color: Colors.white),
                   Row(
                    children: <Widget>[
                      rowCell(99, '${widget.userid.Age}'),
                      rowCell(99, '${widget.userid.Age}'),
                      rowCell(99, '${widget.userid.Age}'),
                    ],),
                ],
              ),
            )
        )
      ],
      ),
    );
  }
  
  Widget rowCell(int count, String type) =>  Expanded(child:  Column(children: <Widget>[
     Text('$count',style:  TextStyle(color: Colors.white),),
     Text(type,style:  TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
  }