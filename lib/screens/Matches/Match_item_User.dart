import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/screens/Matches/Match_Invite_Route.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/Matches.dart';
//import './Field_Details.dart';
import './Match_Details_User.dart';

class MatchItem extends StatelessWidget {


  final Match match;
  MatchItem({ this.match });

  @override
  Widget build(BuildContext context) {
    
godetails(Match id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> Match_Details(matchid: match)  ) );

}

return StreamBuilder<Field>(
      stream: FieldService(fieldid: match.Field).fieldd,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Field fieldData = snapshot.data;
   return Container(
     child: Row(
         children: <Widget>[
     Expanded(
     child:
       Card(
  
      margin:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),

  child: ClipRRect(
      
            borderRadius: BorderRadius.circular(20),
  
     child:Column(mainAxisSize: MainAxisSize.min,
     crossAxisAlignment: CrossAxisAlignment.center,
     
     children: <Widget>[
      

       ClipRRect(
            borderRadius: BorderRadius.circular(20),

       child:  GestureDetector(
         onTap: () => godetails(match),
       
       
       child: Image.network(fieldData.images[0], height: 200, width: 420, fit: BoxFit.cover, ),),
       ), 
       InkWell(
         onTap: () => godetails(match),
              child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),

                            child: Container(
                  color :Color.fromRGBO(207, 243, 246, 100) ,
                   padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
                         margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


child: Padding(
          padding: const EdgeInsets.only(bottom: 50 , top: 20) ,

          child:Row (
            children: <Widget>[
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Container(child: IconButton(icon: Icon(FontAwesomeIcons.calendar , color: Colors.blue ,size: 25,), onPressed:(){})),
                    Text( match.Check_in.substring(5,16) , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    


                ],
              ),
               Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
                       children: <Widget>[    
      
                   Container(child: IconButton(icon: Icon(FontAwesome.dollar , color: Colors.blue ,size: 25,), onPressed:(){})),
                    Text( (int.parse(match.Price)/10).toStringAsFixed(0) +' '  + '\$',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
                    
                    ]),
                    Column(children: <Widget>[
                      Container(child: IconButton(icon: Icon(FontAwesomeIcons.locationArrow , color: Colors.blue ,size: 25,), onPressed:(){})),
                      Text(  match.Location ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,

                    ],)
                    ],
     mainAxisAlignment:MainAxisAlignment.spaceAround,
      mainAxisSize:MainAxisSize.max,
         crossAxisAlignment:CrossAxisAlignment.center,
      
          ),
          )),
              ),
       )
     ],)
     
)),),],),
   );
        }else{return Loading();}});
  }
}
