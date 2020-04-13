import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;


class Friends_Details extends StatefulWidget{
  final User userid;

  Friends_Details({this.userid});
    
 
  @override
  _Friends_DetailsState createState() => _Friends_DetailsState();
}

class _Friends_DetailsState extends State<Friends_Details> {


@override
  Widget build(BuildContext context) {

    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg';

 User user = Provider.of<User>(context);
 List <User> users=[
    User(ID: widget.userid.ID,),
  ];
List <User> userses=[
    User(ID:user.ID,),
  ];final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar() {
    final snackBar = new SnackBar(
        content: new Text("You follow ${widget.userid.FName} successfully"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back', onPressed: (){
           Navigator.pop(context);
        }),
    );
    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }_showSnackBar2() {
    final snackBar = new SnackBar(
        content: new Text("You already Unfollow ${widget.userid.FName} successfully"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back', onPressed: (){
           Navigator.pop(context);
        }),
    );
    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }




    return  StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
         if(snapshot.hasData){
          User userData = snapshot.data;
          if (userData.followingusers.map((e) => e.ID).contains(widget.userid.ID)) {
              return Scaffold(
        appBar: AppBar(
          title: Text(userData.FName),
          ),
            key:   _scaffoldKey,
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
                  label: Text('Unfollow'),
                 onPressed: () async{
                                  await UserService().unefollow(user.ID, users);
                                  await UserService().unfollow(widget.userid.ID, userses);
                                      _showSnackBar2();

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
  
}else{/******************************************************************************************************************* */
  return Scaffold(
        appBar: AppBar(
          title: Text(userData.FName),
          ),
            key:   _scaffoldKey,
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
                 onPressed: () async{
                         
                                  await UserService().follow(user.ID, users);
                                  await UserService().follower(widget.userid.ID, userses);
                                      _showSnackBar();
                                     
                            

                  

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
          
         }else{return Loading();}
         }
    );
  }
  
  Widget rowCell(int count, String type) =>  Expanded(child:  Column(children: <Widget>[
     Text('$count',style:  TextStyle(color: Colors.white),),
     Text(type,style:  TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
  }