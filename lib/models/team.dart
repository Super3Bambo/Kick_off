import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/league.dart';
import './User.dart';
import 'field.dart';

class  Team {
   String ID;
   String Name;
   String NO_team;
   Timestamp Date;
   List <User> users;
   String Counter;
   String Owner;
   String Photo;
  List<Field> start_time;
  List<Field> finish_time; 
  List<Field> duration; 
  List<Team> team;
  String Topic;
  bool Private ;

  Team ({ this.ID ,  this.Topic,this.Name ,this.Photo, this.NO_team  , this.Date , this.users , this.Counter , this.duration, this.finish_time, this.Private,this.start_time , this.team , this.Owner});

  Team.fromMap( Map<dynamic, dynamic> data)
       : ID = data['UserID'];

       Team.fromMap2( Map<dynamic, dynamic> data)
       : ID = data['TeamID'];

       Team.fromMap3(Map<dynamic, dynamic> data)
       : ID = data['LeagueID'];

}

