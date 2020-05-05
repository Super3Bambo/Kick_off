import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/team.dart';
import './User.dart';

class Match {

  final String ID;
  final String Field;
  final String Location;
  final Timestamp Date;
  final String Price;
  final String Check_in;
  final String Check_out;
  final int Counter;
  final bool Challenge;
  final String Topic;
  final List <User> users;
  final List <Team> team;

  
  //final String users;
  Match ({ this.ID , this.Field, this.Location, this.Date , this.Price,  this.Check_in , this.Check_out ,  this.users , this.Counter ,this.Challenge, this.team , this.Topic});





   /*  static List<Map> ConvertUsersToMap({List<User> user}) {
    List<Map> steps = [];
    user.forEach((User users) {
      Map step = users.toMap();
      steps.add(step);
    });
    return steps;
  }
*/
}

