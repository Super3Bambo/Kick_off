import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './Rating.dart';


class User with ChangeNotifier {
   String ID;
   String FName;
   String LName;
   String Position;
   String Age;
   String Phone ;
   String Area;
   bool Is_banned;
   String Photo_url;
   List<User> followingusers;
   List<User> followerusers;
 // List<Rating> rating;
    User({ this.ID , this.FName , this.LName, this.Position , this.Age , this.Phone , this.Area , this.Is_banned = false, this.Photo_url , this.followingusers , this.followerusers /*this.rating*/});

     User.fromMap(Map<dynamic, dynamic> data)
       : ID = data['UserID'];

 }
