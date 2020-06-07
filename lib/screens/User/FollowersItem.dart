import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/Home/homepage.dart';
import 'package:provider/provider.dart';

import 'FollowingDetails.dart';

class FollowersItem extends StatelessWidget {


  final User followers;
  FollowersItem({ this.followers });

  
  @override
  Widget build(BuildContext context) {
       User user = Provider.of<User>(context);

    godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Following_Details(userid: followers)  ) );}

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(    
          onTap: () {if(followers.ID == user.ID){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage() ),);
          }else{return godetails(followers);
          }
          
          } ,     
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(followers.FName),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(followers.Age),
      ),
    )
    );

  }
}
