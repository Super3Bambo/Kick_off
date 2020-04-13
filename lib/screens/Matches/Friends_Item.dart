import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/Home/homepage.dart';
import 'package:provider/provider.dart';
import 'Friends_Details.dart';

class FriendsItem extends StatelessWidget {


  final User friends;
  FriendsItem({ this.friends });

  
  @override
  Widget build(BuildContext context) {
       User user = Provider.of<User>(context);

    godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Friends_Details(userid: friends)  ) );}

  
    return Padding(
        
      padding: const EdgeInsets.only(top: 8.0),
      
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(    
        trailing:SingleChildScrollView(
          child: Column(
          children: <Widget>[
            SizedBox(height: 2.0),
              FlatButton(
                color: Colors.pink[400],
                child: Text(
                  'Invite',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: ()  {
                    
                    }
                
              ),
          ],
        ),),
        //  onTap: () {IconButton(icon:Icon(Icons.grade), onPressed:(){} );} 
             
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(friends.FName),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(friends.Age),
      ),
    )
    );

  }
}
