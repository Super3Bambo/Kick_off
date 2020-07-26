import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/field.dart';
import '../../models/Matches.dart';
//import './Field_Details.dart';
import './Match_Details_Complete.dart';
import 'Match_EvaluteDetails.dart';

class MatchItem_Rate extends StatelessWidget {


  final Match match;
  MatchItem_Rate({ this.match });

  @override
  Widget build(BuildContext context) {
    
godetails(){
Navigator.push(context,MaterialPageRoute(builder: (context)=> Evalte_Details(matchid: match)  ) );

}

return StreamBuilder<Field>(
      stream: FieldService(fieldid: match.Field).fieldd,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Field fieldData = snapshot.data;
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
       onTap: () => godetails(),
     
     
     child: Image.network(fieldData.images[0], height: 200, width: 420, fit: BoxFit.cover, ),),
     ), 
     InkWell(
       onTap: () => godetails(),
            child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                          child: Container(
                color :Color.fromRGBO(207, 243, 246, 100) ,
                 padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
                       margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


child: Padding(
        padding: const EdgeInsets.only(bottom: 12 , top: 10) ,

        child: Column(
          children: [
            Row(
              children: <Widget>[     
               
                  Text(fieldData.Name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  //Text('was Played in',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(match.Check_out.substring(0,16),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  
 ],
   mainAxisAlignment:MainAxisAlignment.spaceAround,
    mainAxisSize:MainAxisSize.max,
       crossAxisAlignment:CrossAxisAlignment.start,
    
            ),
            Container( margin: EdgeInsets.only(top:7), child: Text('Rate Now!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.redAccent[700]),)),
          ],
        ),
        
        )),
            ),
     )
   ],)
   
));}else{return Loading();}});
  }
}