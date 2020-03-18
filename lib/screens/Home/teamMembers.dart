import 'package:flutter/material.dart';

class teamMembers extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    child: Text('محمود محمد فراج اللي مبيعرفش يلعب',
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