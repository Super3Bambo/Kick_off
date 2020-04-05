import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../../models/Matches.dart';
import '../../Services/Match.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';


class Match_DetailsProgress extends StatefulWidget{
  
  final Match matchid;

  Match_DetailsProgress({this.matchid});
 
  @override
  _Match_DetailsProgressState createState() => _Match_DetailsProgressState();
}

class _Match_DetailsProgressState extends State<Match_DetailsProgress> {


         


@override
  Widget build(BuildContext context) {
User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
  List<String> myList = List<String>(2);
                        myList = widget.matchid.users.map((f)=>f.ID).toList();
  String matchId = widget.matchid.ID;

 return Scaffold(
      appBar: AppBar(
        title: Text(widget.matchid.ID),
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
                           // new Text(widget.matchid.Location),
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

SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[300],
                child: Text(
                  'Join',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  int t= widget.matchid.users.length+1;
                  await MatchService().joinMatch(matchId , users);
                    await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in.toDate(), widget.matchid.Check_out.toDate()
                    , widget.matchid.Price, t.toString());
                    
                           
                    Navigator.pop(context);
                  
                }
              ),

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