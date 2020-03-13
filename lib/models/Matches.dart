import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './field.dart';
import './User.dart';

class Match with ChangeNotifier{

  final String ID;
  final String field;
  final String Location;
  final DateTime Date;
  final String Price;
  final DateTime Check_in;
  final DateTime Check_out;
  final List <User> users;
  //final String users;
  Match ({ this.ID , this.field, this.Location, this.Date , this.Price,  this.Check_in , this.Check_out ,  this.users});
}

