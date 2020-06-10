import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Home/homepage.dart';
import 'package:provider/provider.dart';

class AllTeamsItem extends StatelessWidget {


  final Team teams;
  AllTeamsItem({ this.teams });

  
  @override
  Widget build(BuildContext context) {
       User user = Provider.of<User>(context);

  //  godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Following_Details(userid: followers)  ) );}

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(        
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(teams.Name),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(teams.NO_team),
      ),
    )
    );

  }
}
