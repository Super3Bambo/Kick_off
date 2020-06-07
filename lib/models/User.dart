import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './Rating.dart';
import 'field.dart';


class User with ChangeNotifier {
   String ID;
   String FName;
   String LName;
   String Position;
   String Age;
   String Phone ;
   String Area;
   String Role;
   bool Is_banned;
   String Photo_url;
   String TeamID;
   String Token;
   List<User> followingusers;
   List<User> followerusers;
  List<Field> start_time;
  List<Field> finish_time; 
    List<Field> duration; 
   List<UserRating> rating;
    User({ this.ID , this.FName , this.LName, this.Position , this.TeamID,this.Age , this.Phone , this.Area , this.Is_banned = false, this.Photo_url ,
     this.followingusers , this.followerusers /*this.rating*/ ,this.start_time ,this.finish_time,this.duration,this.Role ,this.rating ,this.Token});

     User.fromMap(Map<dynamic, dynamic> data)
       : ID = data['UserID'];

     /*   User.fromMap2(Map<dynamic, dynamic> data)
       : ID = data['StartTime'];
User.fromMap3(Map<dynamic, dynamic> data)
       : ID = data['FinishTime'];
       User.fromMap4(Map<dynamic, dynamic> data)
       : ID = data['Dur'];*/

 }
