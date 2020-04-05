import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Progress.dart';

class Matches extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
     /* body: Row(
        children: <Widget>[
          Expanded(
             child: Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                },
                child: Container(
                  
                  padding: const EdgeInsets.all(36.0),
                  width: 300,
                  height: 100,
                  child: Text('Match in Wadi Degla, Friday 8 PM.',
                    style: TextStyle(fontSize: 20.0),),
                ),
              ),
            ),
          ),
        ],
      )*///body: Center(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 170.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
              onPressed: () {
                 // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(builder: (context) => FieldsOverview()),);
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  MatchesOverviewProgress() ),);
                },
                child: Text(
                  "Matches On Progress",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
              onPressed: () {
                 // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(builder: (context) => FieldsOverview()),);
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  MatchesOverview() ),);
                },
                child: Text(
                  "Histroy Matches",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
               
              ],),),
    );
  }
}