import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/Home/homepage.dart';
import 'package:provider/provider.dart';
import 'Member_Details.dart';

class MembersItem extends StatelessWidget {


  final User members;
  MembersItem({ this.members });

  
  @override
  Widget build(BuildContext context) {
       User user = Provider.of<User>(context);

    godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Members_Details(userid: members)  ) );}

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(    
          onTap: () {if(members.ID == user.ID){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage() ),);
          }else{return godetails(members);}
          
          } ,     
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(members.FName),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(members.Age),
      ),
    )
    );

  }
}
