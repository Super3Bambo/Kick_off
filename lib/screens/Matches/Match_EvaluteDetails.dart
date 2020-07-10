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
     User user = Provider.of<User>(context);
List<User> userses=[
  User(ID: user.ID),
];
                // final members = Provider.of<List<User>>(context) ?? [];

     return Scaffold(
       appBar: AppBar(
         title:Text('Rate Your Match'),
       ),
            body: Column(
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
            new Text('.LName',
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
    );
     }else{return Loading();
     }
          }
         ),
         StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[1].ID).userData,
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
    );
     }else{return Loading();
     }
          }
         ),
         StreamBuilder<User>(
          stream: UserService(userid: widget.matchid.users[2].ID).userData,
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
    );
     }else{return Loading();
     }
          }
         ),


  RaisedButton( color: Colors.pink,child: Text('Rate!'),onPressed: () async{
    List<FieldRating> fieldrate=[FieldRating(Rate: field.toInt())];
    FieldService().ratefield(widget.matchid.Field, fieldrate);

   List<UserRating> rate1=[UserRating(Skills:user1.toInt() ,Morality:user1.toInt() ,Position_Skills:user1.toInt() ),];
    UserService().rate(widget.matchid.users[0].ID, rate1);

  List<UserRating> rate2=[UserRating(Skills:user2.toInt() ,Morality:user2.toInt() ,Position_Skills:user2.toInt() ),];
    UserService().rate(widget.matchid.users[1].ID, rate2);

  List<UserRating> rate3=[UserRating(Skills:user3.toInt() ,Morality:user3.toInt() ,Position_Skills:user3.toInt() ),];
    UserService().rate(widget.matchid.users[2].ID, rate3);

    List<UserRating> rate4=[UserRating(Skills:user4.toInt() ,Morality:user4.toInt() ,Position_Skills:user4.toInt() ),];
    UserService().rate(widget.matchid.users[3].ID, rate4);

    List<UserRating> rate5=[UserRating(Skills:user5.toInt() ,Morality:user5.toInt() ,Position_Skills:user2.toInt() ),];
    UserService().rate(widget.matchid.users[4].ID, rate5);

    List<UserRating> rate6=[UserRating(Skills:user6.toInt() ,Morality:user6.toInt() ,Position_Skills:user6.toInt() ),];
    UserService().rate(widget.matchid.users[5].ID, rate6);

    List<UserRating> rate7=[UserRating(Skills:user7.toInt() ,Morality:user7.toInt() ,Position_Skills:user7.toInt() ),];
    UserService().rate(widget.matchid.users[6].ID, rate7);

    List<UserRating> rate8=[UserRating(Skills:user8.toInt() ,Morality:user8.toInt() ,Position_Skills:user8.toInt() ),];
    UserService().rate(widget.matchid.users[7].ID, rate8);

    List<UserRating> rate9=[UserRating(Skills:user9.toInt() ,Morality:user9.toInt() ,Position_Skills:user9.toInt() ),];
    UserService().rate(widget.matchid.users[8].ID, rate9);

    List<UserRating> rate10=[UserRating(Skills:user10.toInt() ,Morality:user10.toInt() ,Position_Skills:user10.toInt() ),];
    UserService().rate(widget.matchid.users[9].ID, rate10);
    MatchService().removeevaluted(widget.matchid.ID, userses);
  })
     

      ],
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