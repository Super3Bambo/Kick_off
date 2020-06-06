import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import '../../models/Matches.dart';
import 'package:flutter_app/screens/Matches/Match_Details_Progress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:intl/intl.dart';

import 'MatchChallengeDetails.dart';
class MatchItemChallenge extends StatelessWidget {
  final Match match;
  final Team team;
  MatchItemChallenge({ this.match ,this.team});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");

    godetails(Match id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchChallenge_Details(matchid: match)  ) );

}
    DateTime c = dateFormat.parse(match.Check_in);
    var now= DateTime.now();
    var diff= c.difference(now).inHours.toString();
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
                    onTap: () => godetails(match),


                    child: Image.asset('images/5omasy.jpg', height: 200, width: 420, fit: BoxFit.cover, ),),
                ),
                InkWell(
                  onTap: () => godetails(match),
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
                                    Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: new LinearPercentIndicator(
                                        width: 250,
                                        animation: true,
                                        lineHeight: 20.0,
                                        animationDuration: 2000,
                                        percent: match.users.length/10.toDouble(),
                                        center: Text((match.users.length*10).toString() + '%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                        linearStrokeCap: LinearStrokeCap.roundAll,
                                        progressColor: Colors.blue,
                                      ),
                                    ),

                                    IconButton(icon: Icon(FontAwesomeIcons.locationArrow , color: Colors.blue ,size: 25,), onPressed: null,)

                                  ]
                              ),
                              Container(
                                  margin: EdgeInsets.only(top:20),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: <Widget>[

                                        Text('Start After' +':' +diff +' ' +'Hours', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                        Text(  match.Price + '\$',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
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
