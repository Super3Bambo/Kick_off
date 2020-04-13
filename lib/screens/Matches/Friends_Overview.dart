import 'package:flutter_app/Shared/Loading.dart';
import '../../models/Matches.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Friends_listview.dart';
import '../../models/User.dart';
import '../../Services/User.dart';

class FriendsOverview extends StatelessWidget {

  
  

  @override
  Widget build(BuildContext context) {
 User user = Provider.of<User>(context);
  return  StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
         if(snapshot.hasData){
          User userData = snapshot.data;
    return StreamProvider<List<User>>.value(
      value: UserService(usr:userData.followingusers.map((e) => e.ID).toList() ).friends,
      
      child: Scaffold(
        appBar: AppBar(
          title:Text('Match Members')         
        ),
        body: Container(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: MatchFriends(),
        ),
      ),
    );
  }else{return Loading();}
}
  );
  }

}