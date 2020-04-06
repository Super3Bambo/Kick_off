import 'package:cloud_firestore/cloud_firestore.dart';
import './User.dart';

class  Team {
  final String ID;
  final String Name;
  final String NO_team;
  final Timestamp Date;
  final List <User> users;
  String Counter;

  Team ({ this.ID ,  this.Name , this.NO_team  , this.Date , this.users , this.Counter});
}

