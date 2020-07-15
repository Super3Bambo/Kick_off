/*import 'package:flutter/material.dart';
import './Field_Details.dart' ;
import 'package:provider/provider.dart';
import '../../models/field.dart';

class FieldItem extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final fields = Provider.of<Field>(context , listen: false);
    
        
        
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
        color: Color.fromARGB(300, 30, 30,30),
        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: ListTile(
          onTap: (){
              Navigator.of(context).pushNamed(
              FieldDetails.routeName,
              arguments: fields.ID,);
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
}*/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_bar/rating_bar.dart';
import '../../models/field.dart';
import './Field_Details.dart';


class FieldItem extends StatelessWidget {


  final Field fields;
  FieldItem({ this.fields });

  @override
  Widget build(BuildContext context) {
    int sum = 0;
    fields.rate.map((e) => e.Rate).forEach((int e){sum += e;});
      double count= sum/fields.rate.length;
    
godetails(Field id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> FieldDetails(fieldid: fields)  ) );

}
    return Card(
  
    margin:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),

  child: ClipRRect(
    
          borderRadius: BorderRadius.circular(20),
  
   child:Column(mainAxisSize: MainAxisSize.min,
   crossAxisAlignment: CrossAxisAlignment.center,
   
   children: <Widget>[
    

     ClipRRect(
          borderRadius: BorderRadius.circular(20),

     child:  GestureDetector(
       onTap: () => godetails(fields),
     
     
     child: Image.asset('images/5omasy.jpg', height: 200, width: 420, fit: BoxFit.cover, ),),
     ), 
     InkWell(
       onTap: () => godetails(fields),
            child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                          child: Container(
                color :Color.fromRGBO(207, 243, 246, 100) ,
                 padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
                       margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


child: Padding(
        padding: const EdgeInsets.only(bottom: 20 , top: 10) ,

        
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
        mainAxisSize:MainAxisSize.max,
       crossAxisAlignment:CrossAxisAlignment.start,
          children: <Widget>[     
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[    
                RatingBar.readOnly(
                initialRating: count.floor().toDouble(),
                isHalfAllowed: true,
                halfFilledIcon: Icons.star_half,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
              ),
              IconButton(icon: Icon(FontAwesomeIcons.locationArrow , color: Colors.blue ,size: 25,), onPressed: null,)

                 ]
              ),
              Container(
                  margin: EdgeInsets.only(top:20),
              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                 children: <Widget>[    

              Text('Name' +':' +fields.Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
               Text('Price' + ':'+ fields.Price.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
               Container(margin: EdgeInsets.only(right:7), child: Text( fields.Location.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)))  ,
              ]))
              
             
              
 ],
   
      
        ),
        )),
            ),
     )
   ],)
   
));
  }
}
