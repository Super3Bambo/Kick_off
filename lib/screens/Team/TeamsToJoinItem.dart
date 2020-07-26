import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Request_team.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Home/homepage.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';

class AllTeamsItem extends StatefulWidget {


  final Team teams;
  AllTeamsItem({ this.teams });

  @override
  _AllTeamsItemState createState() => _AllTeamsItemState();
}

class _AllTeamsItemState extends State<AllTeamsItem> {
    List<String> tempmember=[];
        String statue;


  @override
  Widget build(BuildContext context) {
      final FirebaseMessaging _fcm = FirebaseMessaging();

User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
  //  godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Following_Details(userid: followers)  ) );}
return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userData = snapshot.data;
       return Card(

           margin:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),

           child: ClipRRect(

               borderRadius: BorderRadius.circular(20),

               child:Column(mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.center,

                 children: <Widget>[


                   ClipRRect(
                     borderRadius: BorderRadius.circular(20),

                     child:  GestureDetector(
                    //   onTap: () => godetails(fields),


                       child: Image.asset('images/5omasy.jpg', height: 200, width: 420, fit: BoxFit.fill, ),),
                   ),
                   InkWell(
                  //   onTap: () => godetails(fields),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(10),

                       child: Container(
                           color :Color.fromRGBO(207, 243, 246, 100) ,
                           padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
                           margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


                           child: Padding(
                             padding: const EdgeInsets.only(bottom: 20 , top: 10) ,


                             child: Column(
                               mainAxisAlignment:MainAxisAlignment.spaceBetween,
                               mainAxisSize:MainAxisSize.max,
                               crossAxisAlignment:CrossAxisAlignment.start,
                               children: <Widget>[
                                 Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: <Widget>[
                                       Container(margin: EdgeInsets.only(top:2), child: 
                                       widget.teams.users.length==0?Text('Waiting For'+" "+  int.tryParse(widget.teams.NO_team).toString()+' ' +'Players'):
                                       (int.tryParse(widget.teams.NO_team) == widget.teams.users.length)==false?
                                       Text('Waiting For'+" "+ (  int.tryParse(widget.teams.NO_team)-widget.teams.users.length ).toString()+' ' +'Players'):Text('Completed'),),
                                      //  RatingBar.readOnly(
                                      // //   initialRating: count.floor().toDouble(),
                                      //    isHalfAllowed: true,
                                      //    halfFilledIcon: Icons.star_half,
                                      //    filledIcon: Icons.star,
                                      //    emptyIcon: Icons.star_border,
                                      //  ),
                                        Container(
                                          margin: EdgeInsets.only(top:10),
                          child:GestureDetector(
                            child:RaisedButton(
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
                                    '       Join      ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                    onPressed: () async {
                      if(widget.teams.Private==false){
                   await   TeamService().joinTeam(widget.teams.ID, users);
                   await _fcm.subscribeToTopic(widget.teams.Topic);
                    await UserService(userid: user.ID).updateUserData(userData.FName, userData.LName, userData.Age, userData.Position, userData.Area, userData.Phone, 
                          userData.Photo_url, widget.teams.ID, userData.Token);
                          setState(() {
                            statue='You have been Joined Team';
                          });}
                          else{
                            if(tempmember.contains(user.ID)){
                              setState(() {
                            statue='You have been sent request Already';
                          });
                            }
                            else{
                            await RequestService().requesttojointeam(user.ID, widget.teams.ID, DateTime.now().toString());
                            tempmember.add(user.ID);
                             setState(() {
                            statue='You have been sent request to join team';
                          });
                          }
                          }
                    }))),
                                       IconButton(icon: Icon(FontAwesome.circle , color:
                                        (int.tryParse(widget.teams.NO_team) == widget.teams.users.length)==false?Colors.green:Colors.grey ,size: 15,), onPressed: null,)

                                     ]
                                 ),
                                 Container(
                                     margin: EdgeInsets.only(top:1),
                                     child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                         children: <Widget>[

                                           statue==null?Text('hhh', style: TextStyle( fontSize: 15,color: Colors.redAccent[700]),):
                                           Text(statue, style: TextStyle( fontSize: 15,color: Colors.redAccent[700]),),
                                          // Text('Price' + ':'+ fields.Price,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
                                         ]))



                               ],


                             ),
                           )
                           ),
                     ),
                   )
                 ],)

           )
           );
           }else{return Loading();}
           }
           );

  }
}
