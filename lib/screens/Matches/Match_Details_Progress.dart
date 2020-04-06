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
  List<String> myList = List<String>();
                        myList = widget.matchid.users.map((f)=>f.ID).toList();
  String matchId = widget.matchid.ID;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar() {
    final snackBar = new SnackBar(
        content: new Text("You already in this Match"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back', onPressed: (){
           Navigator.pop(context);
        }),
    );
    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

   _showSnackBar2() {
    final snackBar = new SnackBar(
        content: new Text("atch Complete"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back', onPressed: (){
           Navigator.pop(context);
        }),
    );
    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

   _showSnackBar3() {
    final snackBar = new SnackBar(
        content: new Text("Join to match Done"),
        duration: new Duration(seconds: 3),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back', onPressed: (){
           Navigator.pop(context);
        }),
    );
    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

 return Scaffold(
   key: _scaffoldKey,
      appBar: AppBar(
        title: Text(user.ID),
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
                            new Text(myList.length.toString()),
                        
                            
                            
                       /*    ListView.builder(
                              itemCount:myList.length,
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
                  if(myList.contains(user.ID)){
              /*Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'You Already in This Match',
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Back',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );*/
              _showSnackBar();

              

                  }
                  
                else if (myList.length==10) {
                   _showSnackBar2();
                 } 
                  else{
                  int t= widget.matchid.users.length;
                  await MatchService().joinMatch(matchId , users);
                    await MatchService().editMatch(widget.matchid.ID ,widget.matchid.Field, widget.matchid.Date.toDate() ,widget.matchid.Location, widget.matchid.Check_in.toDate(),
                     widget.matchid.Check_out.toDate() , widget.matchid.Price, t.toString());
                    _showSnackBar3();
                         /*   Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Join to match Done',
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Back',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );*/
                   // Navigator.pop(context);
                    }
                  
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