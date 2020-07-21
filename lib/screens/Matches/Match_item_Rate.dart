import 'package:flutter/material.dart';
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
     
     
     child: Image.asset('images/5omasy.jpg', height: 200, width: 420, fit: BoxFit.cover, ),),
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
        padding: const EdgeInsets.only(bottom: 50 , top: 20) ,

        child: Row(
          children: <Widget>[     
           
              Text(match.users.map((f)=>f.ID).toString()),
              Text('data')
              
 ],
   mainAxisAlignment:MainAxisAlignment.spaceBetween,
    mainAxisSize:MainAxisSize.max,
       crossAxisAlignment:CrossAxisAlignment.start,
    
        ),
        )),
            ),
     )
   ],)
   
));
  }
}