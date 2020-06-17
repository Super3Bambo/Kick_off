import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/team.dart';
import './User.dart';

class LeagueMatch {

  final String ID;
  final String Field;
  final String Location;
  final String Check_in;
  final String Check_out;
  final List <Team> team;

  
  //final String users;
  LeagueMatch ({ this.ID , this.Field, this.Location,    this.Check_in , this.Check_out ,  this.team });
}