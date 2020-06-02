import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/Team/FieldsChallenge_Details.dart';
import '../../models/field.dart';


class FieldChallengeItem extends StatelessWidget {


  final Field fields;
  final Team teamid;

  FieldChallengeItem({ this.fields ,this.teamid});


  @override
  Widget build(BuildContext context) {
    
godetails(Field id , Team ids){
Navigator.push(context,MaterialPageRoute(builder: (context)=> FieldDetails(fieldid: fields ,teamid:teamid )  ) );

}
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onTap: () => godetails(fields , teamid), 
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
          title: Text(teamid.ID),
          subtitle: Text(fields.Location),
        ),
      ),
    );
  }
}
