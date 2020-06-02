import 'package:flutter_app/models/team.dart';

class League {
    final String ID;

  final String Name;
  final String Description;
  final String Prize;
  final String Field;
  final String Start_Date;
  final String Finish_Date;
  List<Team> teams;
  League({ this.ID ,  this.Name ,this.Description , this.Prize,this.Field , this.Start_Date , this.Finish_Date ,this.teams });
}

