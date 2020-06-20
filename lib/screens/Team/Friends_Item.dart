import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Invations.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Matches/Friends_Details.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:intl/intl.dart';




class FriendsItem extends StatefulWidget {



  final User friends ; Team team;
  FriendsItem({ this.friends ,this.team });

  @override
  _FriendsItemState createState() => _FriendsItemState();
}

class _FriendsItemState extends State<FriendsItem> {
    final GlobalKey<ScaffoldState> _scaffoldKeys = new GlobalKey<ScaffoldState>();

String message;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:00:000");
DateTime temp =DateTime.now().add(Duration(hours: 4));

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
       User user = Provider.of<User>(context);

    godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Friends_Details(userid: widget.friends)  ) );}
     int sumskills = 0;
    int sumMorality = 0;
    int sumPos = 0;
      widget.friends.rating.map((e) => e.Skills).forEach((int e){sumskills += e;});
      double skillscount= sumskills/widget.friends.rating.length;   
       widget.friends.rating.map((e) => e.Morality).forEach((int e){sumMorality += e;});
      double moralitycount= sumMorality/widget.friends.rating.length;   
       widget.friends.rating.map((e) => e.Position_Skills).forEach((int e){sumPos += e;});
      double poscount= sumPos/widget.friends.rating.length;   
      double total =(skillscount*6+moralitycount*2+poscount)/(3*3);

  
    
            return Container(
              child: Padding(
              
          padding: const EdgeInsets.only(top: 8.0),
          
          child: Card(
              
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(    
                onTap: (){ return godetails(widget.friends);},
              trailing:SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  SizedBox(height: 2.0),
                    FlatButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Invite',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: ()  {
                        if(widget.team.users.map((e) => e.ID).contains(widget.friends.ID)){
                          setState(() {
                            message=widget.friends.FName+' '+'in match already';

                          });                          
                        }
                        else{
                          var date =dateFormat.format(temp);
                          InviteService().sendinviteteam(user.ID, widget.friends.ID, widget.team.ID, date);
                        }
                      }
                      
                    ),
                ],
              ),),
              //  onTap: () {IconButton(icon:Icon(Icons.grade), onPressed:(){} );} 
                   
                
                leading: Container(
                  width: 60,
                  height: 50,
                  child: ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: Image.network(widget.friends.Photo_url , fit: BoxFit.fill,),
                  ),
                ),
               title: Text(widget.friends.FName , ),
           //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
               subtitle: message==null? RatingBar.readOnly(
                                size: 25,
                            initialRating: total,
                            isHalfAllowed: true,
                            halfFilledIcon: Icons.star_half,
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            filledColor:Color.fromRGBO(243, 93, 68, 100),
                            emptyColor: Color.fromRGBO(243, 93, 66, 100),
                            halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                          ):Text(message , style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red),),
          ),
        )
      
    ),
            );

  }
}
