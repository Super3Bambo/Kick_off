import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/Shared/Loading.dart';
import '../../models/Matches.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/User.dart';
import '../../Services/User.dart';
import 'FollowersListView.dart';
import 'Tempfollow.dart';

class FollowersOverview extends StatelessWidget {

   final User userids ;
   FollowersOverview({this.userids});
  

  @override
  Widget build(BuildContext context) {
 User user = Provider.of<User>(context);
if(user.ID==null){
      return Loading();
    }
    else{

    return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userid = snapshot.data;
    if(userid.followerusers.isEmpty){
      var title ='Followers';
      return Tempfollow(title:title);
    }else{

    return StreamProvider<List<User>>.value(
      value: UserService(user: userid.followerusers.map((f)=>f.ID).toList()).members,
      

      child: Scaffold(
        appBar: AppBar(
          title:Text('Followers')         
        ),
        body: Container(
       /*   decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),*/
          child: FollowersUser(),
        ),
      ),
    );
  }
        }else{return Loading();}});}
  }
}