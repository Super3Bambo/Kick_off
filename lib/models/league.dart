import 'package:flutter_app/models/team.dart';

class League {
     String ID;

   String Name;
   String Description;
   String Prize;
   String Field;
   String Start_Date;
   String Finish_Date;
   String Owner;
   String Location;
  List<Team> teams;
  League({ this.ID ,  this.Name ,this.Description , this.Prize,this.Field , this.Start_Date , this.Finish_Date ,this.teams,this.Owner ,this.Location });
 
 
 


}

