import 'package:flutter/cupertino.dart';

import './Rating.dart';


class User with ChangeNotifier {
  final String ID;
  final String FName;
  final String LName;
  final String Position;
  final String Age;
  final String Phone ;
  final String Area;
  final bool Is_banned;
  final String Photo_url;
 // List<Rating> rating;
    User({ this.ID , this.FName , this.LName, this.Position , this.Age , this.Phone , this.Area , this.Is_banned = false, this.Photo_url , /*this.rating*/});

}