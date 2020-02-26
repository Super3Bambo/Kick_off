import 'package:flutter/material.dart';
import './FieldBook.dart' as FieldBook;

class Booking extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
        body:  Card(
          elevation: 2.0,
          shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(16.0),
          ),
          child: new InkWell(
            child: new Column(
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
                  new Text('Wadi Degla',style: TextStyle(fontSize: 20.0),),
                  new SizedBox(height: 16.0),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text('El-Mansheya'),
                      new Text('Feisal'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
            onTap: () {
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => FieldBook.FieldBook()),);
        },
      ),
    ),
    );
}
}