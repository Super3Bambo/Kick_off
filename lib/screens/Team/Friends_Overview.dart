import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_app/screens/User/Tempfollow.dart';
import '../../models/Matches.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Friends_listview.dart';
import '../../models/User.dart';
import '../../Services/User.dart';

class FriendsOverview extends StatelessWidget {

  
  Team team ;
  FriendsOverview({this.team});

  @override
  Widget build(BuildContext context) {




 User user = Provider.of<User>(context);
  return  StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
         if(snapshot.hasData){
          User userData = snapshot.data;
          if(userData.followerusers.isEmpty){
            return Tempfollow(title: 'Friends',);
          }else{
    return StreamProvider<List<User>>.value(
      value: UserService(usr:userData.followerusers.map((e) => e.ID).toList() ).friends,

      child: Scaffold(
        appBar: AppBar(
          title:Text('Friends')         
        ),
        body: Container(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: MatchFriends(team:team),
        ),
      ),
    );}
  }else{return Loading();}
}
  );
  }

}