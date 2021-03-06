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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_bar/rating_bar.dart';
import './Field_Details.dart';
import 'Analysis.dart';
import 'MatchFieldOverview.dart';
import 'editfield.dart';


class FieldItemowner extends StatelessWidget {


  final Field field;
  FieldItemowner({ this.field });

  @override
  Widget build(BuildContext context) {
      final CollectionReference matches = Firestore.instance.collection('Match');

    int sum = 0;
    field.rate.map((e) => e.Rate).forEach((int e){sum += e;});
      double count= sum/field.rate.length;
    
godetails(Field id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> FieldDetailsowner(fieldid: field)  ) );}

godetails2(){
Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchFieldOverview(field: field.ID)  ) );}

godetails3(Field id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> editField(field: field)  ) );}
godetails4(){
Navigator.push(context,MaterialPageRoute(builder: (context)=> AnalysisField(field: field,)  ) );}

    openAlertBox_twobutton(  String title , String content ) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(fontSize: 24.0),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 4.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Container(
                        margin: EdgeInsets.only(top:2),
                        height:100,
                        child: Text(content ,maxLines: 2, style:
                        TextStyle(wordSpacing: 1.5 ,height: 2 ,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            width: 148,
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            decoration: BoxDecoration(
                              color:  Color(0xff00bfa5),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                                // bottomRight: Radius.circular(32.0)
                              ),
                            ),
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap:() {  
                           var deletematch= matches.where('FieldId',isEqualTo:field.ID ); 
                           deletematch.getDocuments().then((querySnapshot){
                             querySnapshot.documents.forEach((doc) {doc.reference.delete(); });
                           });
                             FieldService().deleteField(field.ID);

                          Navigator.pop(context);}
                          ,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.red
                          ),
                          //color: Colors.red,
                          width: 4,
                        ),

                        InkWell(
                          child: Container(

                            width: 148,
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            decoration: BoxDecoration(
                              color:  Color(0xff00bfa5),
                              borderRadius: BorderRadius.only(
                                // bottomLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0)),
                            ),
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: ()=>Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
      );
    }
    goback(){Navigator.pop(context);}

    Delete() async{
      FieldService().deleteField(field.ID);
    }

return  Card(
          margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
         
          shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
          ),
            child: new Column(
          //  mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //color: Color.fromARGB(300, 30, 30,30),
              //margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                Container(
                    height: 77,
                    margin: EdgeInsets.only(left:15,top: 10),
                    child: Row(
                      children: <Widget>[
                        
                           CircleAvatar(
                             radius: 30.0,
                             backgroundColor: Colors.brown[300],
                             backgroundImage: AssetImage('images/1.jpg' ,),
                           ),
                           Row(
                              mainAxisAlignment:MainAxisAlignment.spaceAround ,
                              mainAxisSize:MainAxisSize.max ,
                              crossAxisAlignment: CrossAxisAlignment.center,
                             children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom:5, left: 40 , right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                   Container(
                                  //   margin: EdgeInsets.only(left:50,right: 14),
                                     child: Icon(Icons.attach_money,size: 30,)),
                                  Container(
                                //   margin: EdgeInsets.only(left:50,right: 10),
                                   child: Text(field.Price.toString(),style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                 
                                  
                               ],),
                                ),

                               Container(
                                 margin: EdgeInsets.only(bottom:5, left: 10 , right: 10),
                                 child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.min,
                                  
                                   children: <Widget>[
                                   
                                     Container(
                                   //    margin: EdgeInsets.only(left:25,right: 21),
                                       child: Icon(FontAwesome.newspaper_o ,size: 30,)),
                                     Container(
                                   //  margin: EdgeInsets.only(left:25,right: 0),
                                     child: Text(field.Name,style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                    //  Container(
                                    //  margin: EdgeInsets.only(left:25,right: 0),
                                    //  child: Text(field.Location ,style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                  // Text(field.Location),  
                                 ],),
                               ),
                                Container(
                                  margin: EdgeInsets.only(bottom:5, left: 10 , right: 10),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.min,
                                  
                                   children: <Widget>[
                                   
                                      Container(
                                    // margin: EdgeInsets.only(left:25,right: 0),
                                       child: Icon(Icons.location_on,size: 30,)),  
                                     Container(
                                   //  margin: EdgeInsets.only(left:25,right: 0),
                                     child: Text(field.Location ,style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                  // Text(field.Location),  
                               ],),
                                )
                             ],
                           )
                            
                        
                      ],
                    ),
                   
                  ),
                    Divider(height: 3,color: Colors.blue,thickness: 1,),
                       Container(
                         height: 60,
                           color :Color.fromRGBO(207, 243, 246, 100) ,
                           padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0,0.0),
                           // margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),                         
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisSize:MainAxisSize.max ,
                           mainAxisAlignment:MainAxisAlignment.spaceAround ,
                           children: <Widget>[
                             IconButton(icon: Icon(FontAwesome.calendar_plus_o,size: 30, color: Colors.green[600],),  onPressed: ()=>godetails( field),),
                             IconButton(icon: Icon(FontAwesome.edit,size: 30, color: Colors.green[600],), onPressed: ()=>godetails3(field)),
                             IconButton(icon: Icon(Icons.delete,size: 30, color: Colors.green[600],),
                                 onPressed: (){

                                   openAlertBox_twobutton(  'Caution' , 'Are you sure you want to delete this field?' ); }),

                                 //onPressed:()async=> FieldService().deleteField(field.ID)),
                             IconButton(icon: Icon(Icons.list,size: 30, color: Colors.green[600],), onPressed: ()=>godetails2( ),),
                             IconButton(icon: Icon(FontAwesome.pie_chart,size: 30, color: Colors.green[600],), onPressed: ()=>godetails4()),
                   
                 ],),
                       ),
      
          // Divider(height: 30,color: Colors.greenAccent,thickness: 1,),
        ],
      )
      );
   /* return Card(
  
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
              Text('Price' + ':'+ fields.Price,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
              ]))
              
             
              
 ],
   
      
        ),
        )),
            ),
     )
   ],)
   
));*/
  }
}
