import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../models/Matches.dart';
//import '../../Services/Match.dart';
//import '../../models/User.dart';
import 'package:provider/provider.dart';


class Match_Details_History extends StatefulWidget{
  
  final Match matchid;

  Match_Details_History({this.matchid});
 
  @override
  _Match_Details_HistoryState createState() => _Match_Details_HistoryState();
}

class _Match_Details_HistoryState extends State<Match_Details_History> {


         


@override
  Widget build(BuildContext context) {


 return Scaffold(
      appBar: AppBar(
        title: Text('Match History'),
      ),


        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ClipRRect(
                    child: Image(
                      image: AssetImage('images/5omasy.jpg'),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(16.0),
                      topRight: new Radius.circular(16.0),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(widget.matchid.Date.toDate().toString(),style: TextStyle(fontSize: 20.0),),
                        new SizedBox(height: 16.0),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(widget.matchid.Location),
                            new Text(widget.matchid.users.length.toString()),
                            
                           /* ListView.builder(
                              itemCount: widget.matchid.users.length,
                               itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                   child: Card(
                                      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                                       child: ListTile( 
                                       title: Text('fds'),
                                        subtitle: Text('dfs',
        ),
      ),
    )
    );
                               }),*/
                          ],
                        ),
                        ],
                        ),
                        ),
                ],),
                ),
                ),
 );
              
      //                 FlatButton(
    //                child: Text('Book NOW'),
  //                  onPressed: () {
//                      )



  }}