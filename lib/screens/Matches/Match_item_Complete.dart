import 'package:flutter/material.dart';
import '../../models/Matches.dart';
//import './Field_Details.dart';
import './Match_Details_Complete.dart';

class MatchItem_Complete extends StatelessWidget {


  final Match match;
  MatchItem_Complete({ this.match });

  @override
  Widget build(BuildContext context) {
    
godetails(Match id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> Match_Details(matchid: match)  ) );

}
    return Padding(
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
         subtitle: Text(match.users.length.toString()),
      ),
    )
    );

  }
}
