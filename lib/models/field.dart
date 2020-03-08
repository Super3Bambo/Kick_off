import 'package:flutter/foundation.dart';

class Field with ChangeNotifier {
  

   final String ID;

  final String Name;
  final String Capacitance;
  final String Location;
  final String Start_at;
  final String Finish_at;
  final String Price;
  final String Photo_url;
  final bool  Ball;
  final bool  Bathroom;
  final bool  Refree;
  Field ({ this.ID , this.Name , this.Capacitance , this.Location , this.Start_at , this.Price ,  this.Finish_at  , this.Photo_url , this.Ball , this.Bathroom , this.Refree});
}
