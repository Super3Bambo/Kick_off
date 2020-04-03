import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import './teamMembers.dart';
import './teamBoard.dart';
class Test extends StatelessWidget {

final Team team;
  Test({ this.team });
  

  @override
  Widget build(BuildContext context) {
    
//godetails(Team id){Navigator.push(context,MaterialPageRoute(builder: (context)=> TeamBoard(team: team)  ) );}
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
        child: ListTile(
  //       onTap: () => godetails(team), 
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(team.users.map((e) => e.ID).toString()),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(team.users.map((e) => e.ID).toString()),
      ),
    )
    );

  }
}
