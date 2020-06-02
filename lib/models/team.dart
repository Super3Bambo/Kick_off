import 'package:cloud_firestore/cloud_firestore.dart';
import './User.dart';

class  Team {
   String ID;
   String Name;
   String NO_team;
   Timestamp Date;
   List <User> users;
   String Counter;

  Team ({ this.ID ,  this.Name , this.NO_team  , this.Date , this.users , this.Counter});

  Team.fromMap( Map<dynamic, dynamic> data)
       : ID = data['UserID'];

       Team.fromMap2( Map<dynamic, dynamic> data)
       : ID = data['TeamID'];

}

