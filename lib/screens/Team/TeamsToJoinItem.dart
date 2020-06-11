import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Home/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';

class AllTeamsItem extends StatelessWidget {


  final Team teams;
  AllTeamsItem({ this.teams });

  
  @override
  Widget build(BuildContext context) {
       User user = Provider.of<User>(context);

  //  godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Following_Details(userid: followers)  ) );}

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


                       child: Image.asset('images/5omasy.jpg', height: 200, width: 420, fit: BoxFit.cover, ),),
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
                                       RatingBar.readOnly(
                                      //   initialRating: count.floor().toDouble(),
                                         isHalfAllowed: true,
                                         halfFilledIcon: Icons.star_half,
                                         filledIcon: Icons.star,
                                         emptyIcon: Icons.star_border,
                                       ),
                                       IconButton(icon: Icon(FontAwesomeIcons.locationArrow , color: Colors.blue ,size: 25,), onPressed: null,)

                                     ]
                                 ),
                                 Container(
                                     margin: EdgeInsets.only(top:20),
                                     child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                         children: <Widget>[

                                        //   Text('Name' +':' +fields.Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                          // Text('Price' + ':'+ fields.Price,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
                                         ]))



                               ],


                             ),
                           )),
                     ),
                   )
                 ],)

           ));

  }
}
