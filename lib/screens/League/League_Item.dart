import 'package:flutter/material.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';
import 'League_Details.dart';

class LeagueItem extends StatelessWidget {


  final League league;
  final Team teamid;

  LeagueItem({ this.league ,this.teamid });

  
  @override
  Widget build(BuildContext context) {

    godetails(League id ,Team ids){Navigator.push(context,MaterialPageRoute(builder: (context)=> League_Details(league: league , teamid:teamid)  ) );}

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
       onTap: () => godetails(league, teamid),
     
     
     child: Image.asset('images/5omasy.jpg', height: 200, width: 420, fit: BoxFit.cover, ),),
     ), 
     InkWell(
      onTap: () => godetails(league ,teamid),
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
          /*  Row(
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
              ),*/
              Container(
                  margin: EdgeInsets.only(top:20),
              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                 children: <Widget>[    

              Text(league.Name+" "+"League", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            //  Text('Prize' + ':'+ league.Prize,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
           // Text(teamid.ID),
               league.teams.map((e) => e.ID).isEmpty? Text('Available Now',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),):league.teams.map((e) => e.ID).length==8?
               Text('Full',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),):Text('Available Now',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),)
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
