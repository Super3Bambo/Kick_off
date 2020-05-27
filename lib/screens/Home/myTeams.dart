import 'package:flutter/material.dart';
import '.././Team/createTeam.dart' as teamCreate;
import '.././Team/teamBoard.dart' as Board;
import '../Team/Teams_OverView.dart';

class Teams extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Teams_OverView(); /*Scaffold (
     /* body: Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Board.TeamBoard(),));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(36.0),
                      width: 300,
                      height: 100,
                      child: Text('kij',
                        style: TextStyle(fontSize: 20.0),),
                    ),
                  ),
                ),
              ),
            ],

          ),*/
                    body: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: <Widget>[
                         SizedBox(
                    height: 170.0,
                  ),
            FlatButton(
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
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  Teams_OverView() ),);
                },
                child: Text(
                  "Your Teams",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
                        
        FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => teamCreate.CreateTeam()),);
      // Add your onPressed code here!
    },
    child: Icon(Icons.add),
    backgroundColor: Colors.lightBlueAccent[700],
    ),
                      ] ))
                      );*/
  }
}