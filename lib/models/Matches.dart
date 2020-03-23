import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import './field.dart';
import './User.dart';

class Match {

  final String ID;
  final String Field;
  final String Location;
  final Timestamp Date;
  final String Price;
  final Timestamp Check_in;
  final Timestamp Check_out;
  final List <User> users;

  
  //final String users;
  Match ({ this.ID , this.Field, this.Location, this.Date , this.Price,  this.Check_in , this.Check_out ,  this.users});

}

