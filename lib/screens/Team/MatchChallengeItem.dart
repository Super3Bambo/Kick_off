import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import '../../models/Matches.dart';

class MatchItemChallenge extends StatelessWidget {


  final Match match;
  final Team team;
  MatchItemChallenge({ this.match ,this.team});

  @override
  Widget build(BuildContext context) {
    
godetails(Match id){
//Navigator.push(context,MaterialPageRoute(builder: (context)=> Match_DetailsProgress(matchid: match)  ) );

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
         subtitle: Text(match.team.map((f)=>f.ID).toString()),
      ),
    )
    );
  }
}
