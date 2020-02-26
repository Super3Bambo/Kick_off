import 'package:flutter/material.dart';

class Help extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      body: Row(
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          new Expanded(
            child: Container(
              child: Text('Most of youth in Egypt can’t figure out how to find their favorite sport yet. they didn’t have the chance to experience it or where to do so, and youth -who know where to play their favorite sport- don’t find partners to play with, sports like football -the most common sport in Egypt- needs at least 10 players, sometimes it’s hard to find this number.',
                style: TextStyle(fontSize: 15.0),),
            ),
          ),
        ],
      ),
    );
  }
}