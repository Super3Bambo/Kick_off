import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/screens/Matches/Match_Details_Progress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../models/Matches.dart';
import 'package:intl/intl.dart';


//import './Field_Details.dart';

class MatchItemProgress extends StatelessWidget {


  final Match match;
  MatchItemProgress({ this.match });

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
godetails(Match id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> Match_DetailsProgress(matchid: match)  ) );

}
DateTime c = dateFormat.parse(match.Check_in);
var now= DateTime.now();
var diff= c.difference(now).inHours.toString();

return StreamBuilder<Field>(
      stream: FieldService(fieldid: match.Field).fieldd,
      builder: (context, snapshot){
        if(snapshot.hasData){
          Field fieldData = snapshot.data;
return Container(
  padding: EdgeInsets.only(top:10),
  margin: EdgeInsets.only(bottom: 5),
  child:   Card(
    
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
       
       
       child: Image.network(fieldData.images[0], height: 200, width: 420, fit: BoxFit.fill ),),
       ), 
       InkWell(
         onTap: () => godetails(match),
              child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
  
                            child: Container(
                  color :Color.fromRGBO(207, 243, 246, 100) ,
                   padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
                         margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
  
  
  child: Container(
    //margin: EdgeInsets.only(bottom:100),
    child:   Padding(
            padding: const EdgeInsets.only(bottom: 20 , top: 10) ,
    
            
            child: Column(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
            mainAxisSize:MainAxisSize.max,
           crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[     
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[    
                       Padding(
                  padding: EdgeInsets.all(2.0),
                  child: new LinearPercentIndicator(
                    width: 250,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: match.users.isEmpty?0.0:match.users.length/10.toDouble(),
                    center:  match.users.isEmpty?Text((0.0).toString() + '%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)): Text((match.users.length*10).toString() + '%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.blue,
                  ),
                ),
                   
                  Container(child: IconButton(icon: Icon(FontAwesomeIcons.locationArrow , color: Colors.blue ,size: 25,), onPressed:(){}))
    
                     ]
                  ),
                  Container(
                      margin: EdgeInsets.only(top:20),
                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
                     children: <Widget>[    
    
                  Text('Start After' +':' +diff +' ' +'Hours', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  Text(  match.Price + '\$',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
                  Text(  match.Location ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
                  ]))
                  
                 
                  
     ],
       
          
            ),
            ),
  )),
              ),
       )
     ],)
     
  )),
);}else{return Loading();}});
  }
}
/*return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
         onTap: () => godetails(match), 
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(match.ID),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(match.users.map((f)=>f.ID).toString()),
      ),
    )
    );*/