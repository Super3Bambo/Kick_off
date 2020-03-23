import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/Matches.dart';

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
 // List<Rating> rating;
    User({ this.ID , this.FName , this.LName, this.Position , this.Age , this.Phone , this.Area , this.Is_banned = false, this.Photo_url , /*this.rating*/});
User.fromMap(Map<dynamic, dynamic> data)
       : ID = data['UserID'];
         
 }
