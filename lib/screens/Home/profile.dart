import 'package:flutter/material.dart';
import '../../screens/User/Edit_User.dart';
import '../../screens/User/Show_User_Data.dart';

import 'dart:ui' as ui;

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg';

    return  Stack(children: <Widget>[
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
                 CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                 SizedBox(height: _height/25.0,),
                 Text('Mohamed Hilal', style:  TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                 Padding(padding:  EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child: Text('First Player to join the APP!',
                    style:  TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                 Divider(height: _height/30,color: Colors.white,),
                 Padding(padding:  EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){},
                  child:  Container(child:  Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              FlatButton.icon(
              icon: Icon(Icons.edit),
              label: Text('Edit'),
              onPressed: (){
                               Navigator.push(
              context,
             MaterialPageRoute(builder: (context) => Edituser()));

              },
            ),                    //new Icon(Icons.edit),
                    //new SizedBox(width: _width/30,),
                 //   new Text('Edit')
                  ],)),color: Colors.blue[50],),),
                 Divider(height: _height/30,color: Colors.white),
                 Row(
                  children: <Widget>[
                    rowCell(99, 'SHOOTING'),
                    rowCell(99, 'PASSING'),
                    rowCell(99, 'DEFENDING'),
                  ],),
              ],
            ),
          )
      )
    ],);
  }

  Widget rowCell(int count, String type) =>  Expanded(child:  Column(children: <Widget>[
     Text('$count',style:  TextStyle(color: Colors.white),),
     Text(type,style:  TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}