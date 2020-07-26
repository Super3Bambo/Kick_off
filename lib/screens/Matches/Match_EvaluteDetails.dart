import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/Match.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/Rating.dart';
import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/User.dart';
import '../../models/Matches.dart';
//import '../../Services/Match.dart';
//import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';

import 'test2.dart';
import 'test55.dart';



class Evalte_Details extends StatefulWidget{
  
  final Match matchid;

  Evalte_Details({this.matchid});
 
  @override
  _Evalte_DetailsState createState() => _Evalte_DetailsState();
}

class _Evalte_DetailsState extends State<Evalte_Details> {

        double field , user1, user2,user3,user4,user5,user6,user7,user8,user9,user10;

@override
  Widget build(BuildContext context) {


 openAlertBox( String Title , String Content) {
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
                        Title,
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
                      child: Text(Content,maxLines: 2, style: 
                      TextStyle(wordSpacing: 1.5 ,height: 2 ,fontWeight: FontWeight.bold),),
                    ),
                    // child: TextField(
                      
                    //   decoration: InputDecoration(
                        
                    //     hintText: "fdjignfdkgnfdkjgndfl;gmfdjlkighsdlf",
                    //     border: InputBorder.none,
                    //   ),
                    //   maxLines: 5,
                    // ),
                  ),
                       
                       InkWell(
                        child: Container(
                         
                          //width: 148,
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                             color:  Colors.blue[300],
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
                      ),


                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.center ,
                  //   children: <Widget>[
                  //     InkWell(
                  //       child: Container(
                  //         width: 148,
                  //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  //         decoration: BoxDecoration(
                  //           color:  Color(0xff00bfa5),
                  //           borderRadius: BorderRadius.only(
                  //               bottomLeft: Radius.circular(32.0),
                  //              // bottomRight: Radius.circular(32.0)
                  //               ),
                  //         ),
                  //         child: Text(
                  //           "OK",
                  //           style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.red
                  //       ),
                  //       //color: Colors.red,
                  //       width: 4,
                  //     ),
                     
                  //      InkWell(
                  //       child: Container(
                         
                  //         width: 148,
                  //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  //         decoration: BoxDecoration(
                  //            color:  Color(0xff00bfa5),
                  //           borderRadius: BorderRadius.only(
                  //              // bottomLeft: Radius.circular(32.0),
                  //               bottomRight: Radius.circular(32.0)),
                  //         ),
                  //         child: Text(
                  //           "Cancel",
                  //           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //       onTap: (){},
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        });}


     User user = Provider.of<User>(context);
List<User> userses=[
  User(ID: user.ID),
];
                // final members = Provider.of<List<User>>(context) ?? [];

     return Scaffold(
       appBar: AppBar(
         title:Text('Rate Your Match'),
       ),
            body: Container(
              
              child: SingleChildScrollView(
                              child: Column(
    children: <Widget>[
        Container(
      
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: InkWell(
        //onTap: (){godetails(following);},
                  child: new Stack(
          children: <Widget>[
                Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(  
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0),
          ),
        ],
    ),
    child:  Container(
        margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                new Text('Field',
                  style: headerTextStyle,
                ),
                RatingBar(
                          initialRating: 0.0,
                          isHalfAllowed: false,
                          filledIcon: Icons.sentiment_satisfied,
                emptyIcon: Icons.sentiment_dissatisfied,
                halfFilledIcon: Icons.sentiment_neutral,
                filledColor: Colors.green,
                emptyColor: Colors.redAccent,
                halfFilledColor: Colors.amberAccent,
                 onRatingChanged: (double rating) {setState(() {
                            field=rating;
                          });  }, 
                        ),
                       // new Container(height: 6.0),
                new Row(
                  children: <Widget>[
                   Icon( 
                          Icons.assignment,
                           size: 16.0,
                          color:  Color(0xffb6b2df),        
                       ),              
                    new Container(width: 8.0),
                    new Text('22',
                      style: regularTextStyle,
                    ),
                    new Container(width: 24.0),
                            Icon( 
                          Icons.assignment,
                           size: 16.0,
                          color:  Color(0xffb6b2df),
                                            
                       ),              
                      new Container(width: 8.0),
                    new Text('22',
                      style: regularTextStyle,
                    ),
                  ],
                ),
          ],
        ),
    ),
  ),
                Container(
    margin: new EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                         backgroundColor:  Colors.blueGrey,
                          radius: 50,
                          child: ClipOval(
                            
                         child: SizedBox(
                              width: 85.0,
                              height: 85.0,
                                child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                        //backgroundImage: NetworkImage(imgUrl),
                                
                       
                       ),
                       ),
                       ),
  ),
          ],
        ),
      )
    ),
                         Divider(height: 20,color: Colors.grey,thickness: .5,),

     StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[0].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData1 = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData1.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user1=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData1.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData1.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),
         StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[1].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData2 = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData2.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user2=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData2.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData2.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),
         StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[2].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData3 = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData3.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user3=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData3.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData3.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),


           StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[3].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user4=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),

           StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[4].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user5=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),

           StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[5].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user6=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),


           StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[6].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user7=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),


           StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[7].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user8=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),


           StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[8].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user9=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),


           StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[9].ID).userData,
          builder: (context, snapshot){
                if(snapshot.hasData){
     User userData = snapshot.data;
     return   Container(
          
          height: 120.0,
          margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
          ),
          child: InkWell(
                //onTap: (){godetails(following);},
         child: new Stack(
     children: <Widget>[
       Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
                color: Color(0xFF333366),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
     new BoxShadow(  
       color: Colors.black12,
       blurRadius: 10.0,
       offset: new Offset(0.0, 10.0),
     ),
                ],
    ),
    child:  Container(
                margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
                constraints: new BoxConstraints.expand(),
                child: new Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       new Text( userData.FName,
         style: headerTextStyle,
       ),
       RatingBar(
                     initialRating: 0.0,
                     isHalfAllowed: false,
                     halfFilledIcon: Icons.star_half,
                     filledIcon: Icons.star,
                     emptyIcon: Icons.star_border,
                     filledColor:Color.fromRGBO(243, 93, 68, 100),
                     emptyColor: Color.fromRGBO(243, 93, 66, 100),
                     halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                     onRatingChanged: (double rating) { 
                       setState(() {
                         user10=rating;
                       });
                      }, 
                   ),
                  // new Container(height: 6.0),
       new Row(
         children: <Widget>[
          Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),        
                  ),              
           new Container(width: 8.0),
           new Text(userData.Age,
                 style: regularTextStyle,
           ),
           new Container(width: 24.0),
                       Icon( 
                     Icons.assignment,
                      size: 16.0,
                     color:  Color(0xffb6b2df),
                                       
                  ),              
                 new Container(width: 8.0),
           new Text(userData.Position,
                 style: regularTextStyle,
           ),
         ],
       ),
     ],
                ),
    ),
  ),
       Container(
    margin: new EdgeInsets.only(
                top: 16.0,
                bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                    backgroundColor:  Colors.blueGrey,
                     radius: 50,
                     child: ClipOval(
                       
                    child: SizedBox(
                         width: 85.0,
                         height: 85.0,
                           child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                   //backgroundImage: NetworkImage(imgUrl),
                           
                  
                  ),
                  ),
                  ),
  ),
     ],
                ),
          )
    );
     }else{return Loading();
     }
          }
         ),


                                Container(
                                  margin: EdgeInsets.only(top:10,bottom: 25),
                                  child: RaisedButton(
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
                                      '       Rate!      ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  onPressed: () async{
                                    if(field ==null|| user1==null|| user2==null||user3==null||user4==null||user5==null||
                                    user6==null||user7==null||user8==null||user9==null||user10==null){
                                    openAlertBox('Erorr', 'You should Rate all member');}
else{
    List<FieldRating> fieldrate=[FieldRating(Rate: field.toInt())];
     List<UserRating> rate1=[UserRating(Skills:user1.toInt() ,Morality:user1.toInt() ,Position_Skills:user1.toInt() ),];
       List<UserRating> rate2=[UserRating(Skills:user2.toInt() ,Morality:user2.toInt() ,Position_Skills:user2.toInt() ),];
         List<UserRating> rate3=[UserRating(Skills:user3.toInt() ,Morality:user3.toInt() ,Position_Skills:user3.toInt() ),];
             List<UserRating> rate4=[UserRating(Skills:user4.toInt() ,Morality:user4.toInt() ,Position_Skills:user4.toInt() ),];
                 List<UserRating> rate5=[UserRating(Skills:user5.toInt() ,Morality:user5.toInt() ,Position_Skills:user2.toInt() ),];
                     List<UserRating> rate6=[UserRating(Skills:user6.toInt() ,Morality:user6.toInt() ,Position_Skills:user6.toInt() ),];
                         List<UserRating> rate7=[UserRating(Skills:user7.toInt() ,Morality:user7.toInt() ,Position_Skills:user7.toInt() ),];
                             List<UserRating> rate8=[UserRating(Skills:user8.toInt() ,Morality:user8.toInt() ,Position_Skills:user8.toInt() ),];
                                 List<UserRating> rate9=[UserRating(Skills:user9.toInt() ,Morality:user9.toInt() ,Position_Skills:user9.toInt() ),];
                                     List<UserRating> rate10=[UserRating(Skills:user10.toInt() ,Morality:user10.toInt() ,Position_Skills:user10.toInt() ),];









    await FieldService().ratefield(widget.matchid.Field, fieldrate);
  await UserService().rate(widget.matchid.users[0].ID, rate1);
  await UserService().rate(widget.matchid.users[1].ID, rate2);
   await UserService().rate(widget.matchid.users[2].ID, rate3);
   await UserService().rate(widget.matchid.users[3].ID, rate4);
   await UserService().rate(widget.matchid.users[4].ID, rate5);
   await UserService().rate(widget.matchid.users[5].ID, rate6);
    await UserService().rate(widget.matchid.users[6].ID, rate7);
   await UserService().rate(widget.matchid.users[7].ID, rate8);
    await UserService().rate(widget.matchid.users[8].ID, rate9);
   await UserService().rate(widget.matchid.users[9].ID, rate10);
   await MatchService().removeevaluted(widget.matchid.ID, userses);
    print(widget.matchid.users[0].ID);
        print(widget.matchid.users[1].ID);

    print(widget.matchid.users[2].ID);

    print(widget.matchid.users[3].ID);

        print(widget.matchid.users[4].ID);

    print(widget.matchid.users[5].ID);

    print(widget.matchid.users[6].ID);

    print(widget.matchid.users[7].ID);

    print(widget.matchid.users[8].ID);
        print(widget.matchid.users[9].ID);


print(user1);
print(user2);
print(user3);
print(user4);
print(user5);
print(user6);
print(user7);
print(user8);
print(user9);
Navigator.pop(context);
}

  }),
                                )
     

      ],
  ),
              ),
            ),  
     );
  }}



  
  final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
    );
    final headerTextStyle = baseTextStyle.copyWith(
     // color: const Colors.white,
     color:  Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
    );
     final regularTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 17.0,
      fontWeight: FontWeight.bold
    );