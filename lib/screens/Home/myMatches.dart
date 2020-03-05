import 'package:flutter/material.dart';

class Matches extends StatelessWidget
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
      )
    );
  }
}