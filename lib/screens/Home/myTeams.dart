import 'package:flutter/material.dart';
import '.././Team/createTeam.dart' as teamCreate;
import '.././Team/teamBoard.dart' as Board;

class Teams extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Row(
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
          ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => teamCreate.CreateTeam()),);
      // Add your onPressed code here!
    },
    child: Icon(Icons.add),
    backgroundColor: Colors.lightBlueAccent[700],
    ),
    );
  }
}