import './team.dart';


class Challenge {
  final String ID;
  final String Name;
  final String Description;
  final String Prize;
  final List<Team> team;

  Challenge ({ this.ID , this.Name , this.Description='' , this.Prize ='',this.team });
}

