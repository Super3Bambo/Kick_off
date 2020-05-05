import 'package:flutter/material.dart';
import 'package:flutter_app/Shared/Loading.dart';
import '../../screens/User/Edit_User.dart';
import '../../screens/User/Show_User_Data.dart';
import '../../models/User.dart';
import '../../Services/User.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';



class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {



    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg';

 User user = Provider.of<User>(context);

return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userData = snapshot.data;
          int sumskills = 0;
          int sumMorality = 0;
          int sumPos = 0;
   userData.rating.map((e) => e.Skills).forEach((int e){sumskills += e;});
      double skillscount= sumskills/userData.rating.length;   
       userData.rating.map((e) => e.Morality).forEach((int e){sumMorality += e;});
      double moralitycount= sumMorality/userData.rating.length;   
       userData.rating.map((e) => e.Position_Skills).forEach((int e){sumPos += e;});
      double poscount= sumPos/userData.rating.length;   
      double total =(skillscount*6+moralitycount*2+poscount)/(3*3);
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

                 InkWell(
                //   onTap: ()=>getImage(),
               child:  CircleAvatar(
                   
                    radius: 100,
                    child: ClipOval(
                   child: SizedBox(
                      width: 220.0,
                          height: 220.0,
                          
                  //backgroundImage: NetworkImage(imgUrl),
                 child: (userData.Photo_url!=null)?Image.network(
                          /* --------------------*/  userData.Photo_url,
                            fit: BoxFit.fill,
                          ):Image.network(
                            imgUrl,
                            fit: BoxFit.fill,
                          ),
                          
                 ),),),),

                  

                 SizedBox(height: _height/25.0,),
                 Text(userData.FName + ' ' + '${ userData.LName}', style:  TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
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
                    rowCell(total.toInt(), '${total}'),//
                    rowCell(99, '${userData.Age}'),
                    rowCell(99, '${userData.Age}'),
                  ],),
              ],
            ),
          )
      )
    ],
    );
        }else{ return Loading();}
        }
        );
  }

  Widget rowCell(int count, String type) =>  Expanded(child:  Column(children: <Widget>[
     Text('$count',style:  TextStyle(color: Colors.white),),
     Text(type,style:  TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}