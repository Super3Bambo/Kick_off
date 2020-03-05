import 'package:flutter/material.dart';
import './Field_Details.dart' ;
import 'package:provider/provider.dart';
import '../../models/field.dart';

class FieldItem extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final fields = Provider.of<Field>(context);
        
        
        
      /*  return  Card(
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
         
          shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
          ),
            child: new Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new ClipRRect(
                child: GestureDetector( onTap: () {
                Navigator.push(
                context, MaterialPageRoute(builder: (context) => FieldDetails()),);
                },
                 
              child: Image(
                image: AssetImage(fields.Photo_url),
                ),
                ),
              borderRadius: BorderRadius.only(  
                topLeft: new Radius.circular(16.0),
                topRight: new Radius.circular(16.0),
                bottomLeft: new Radius.circular(16.0),
                bottomRight: new Radius.circular(16.0),
              ),
              ),
              new Padding(
              padding: new EdgeInsets.all(16.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(fields.Name,style: TextStyle(fontSize: 20.0),),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(fields.Location),
                      new Text(fields.Price),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
   
    );*/


    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      
      child: Card(  
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: ListTile(
          onTap: (){
             Navigator.push(
                context, MaterialPageRoute(builder: (context) => FieldDetails()),);
          },
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[300],
           // backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(fields.Name),
          subtitle: Text(fields.Location),
        ),
      ),
    ); 
}
}