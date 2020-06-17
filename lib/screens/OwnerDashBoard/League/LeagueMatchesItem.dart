import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/models/LeagueMatches.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_bar/rating_bar.dart';


class MatchLeagueItem extends StatelessWidget {


  final LeagueMatch match;
  MatchLeagueItem({ this.match });

  @override
  Widget build(BuildContext context) {
    // int sum = 0;
    // field.rate.map((e) => e.Rate).forEach((int e){sum += e;});
    //   double count= sum/field.rate.length;
    
// godetails(Field id){
// Navigator.push(context,MaterialPageRoute(builder: (context)=> FieldDetailsowner(fieldid: field)  ) );}
return  Card(
  elevation: 10.0,
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
                   // margin: EdgeInsets.only(left:15,top: 10),
                    child: Row(
                      
                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                              mainAxisSize:MainAxisSize.max ,
                              crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        
                           Container(
                             width: 50,
                             child: CircleAvatar(
                               radius: 30.0,
                               backgroundColor: Colors.brown[300],
                               backgroundImage: AssetImage('images/1.jpg' ,),
                             ),
                           ),
                           Row(
                             
                             children: <Widget>[
                                Container(
                                  width: 70,
                                  
                                  //margin: EdgeInsets.only(bottom:5, left: 40 , right: 10),
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
                                   child: Text(match.Check_in.substring(2,15),style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                 
                                  
                               ],),
                                ),

                               Container(
                                 width: 70,
                                // margin: EdgeInsets.only(bottom:5, left: 10 , right: 10),
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
                                     child: Text('match.Location',style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                    //  Container(
                                    //  margin: EdgeInsets.only(left:25,right: 0),
                                    //  child: Text(field.Location ,style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                  // Text(field.Location),  
                                 ],),
                               ),
                                Container(
                                  width: 70,
                                 // margin: EdgeInsets.only(bottom:5, left: 10 , right: 10),
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
                                     child: Text('match.Location' ,style:TextStyle(fontWeight: FontWeight.bold ) ,)),
                                  // Text(field.Location),  
                               ],),
                                ),
                                // Container(
                                //   width: 50,
                                //   child: IconButton(icon: Icon(Icons.delete,size: 20, color: Colors.green[600],), onPressed:()async=> FieldService().deleteField(match.ID))),
                             ],
                           )
                            
                        
                      ],
                    ),
                   
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