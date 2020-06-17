import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/league.dart';
import '../models/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/User.dart';
class TeamService {


  final String userid;
    List<String> leagueid;
  TeamService({this.userid,this.leagueid});

  final CollectionReference teams = Firestore.instance.collection('Team');

   Team _teamFromFirebase(DocumentSnapshot team) {
    return team != null ? Team(ID: team.documentID) : null;
  }
 Future<void> deleteteam(id) async {
    return await teams.document(id).delete();}

  Future<void> createTeam(  String id,String name ,String nO_Team, List<User> users ,String topic, List<Field> date , String photo ) async {
    return await teams.document(id).setData({
      'ID':id,
      'Date': DateTime.now(),
      'Name':name ,
      'NO_Team': nO_Team ,
      'Topic':topic,
      'PhotoUrl':photo,
      'Players': users.map((u)=>{'UserID' :u.ID,}).toList(),
       'Start':  date.map((u)=>{'StartTime' :u.Date}).toList(),
      'Finish': date.map((u)=>{'FinishTime' :u.Date}).toList(),
      'Duration': date.map((u)=>{'Dur' :u.Date}).toList(),
      
  });    
  }
  

Future <void> timestart(String ID , List<Field> time)async{
    
  return await teams.document(ID).updateData({'Start':FieldValue.arrayUnion(time.map((e) =>{"StartTime": e.Start_at}).toList())});
}
Future <void> timefinish(String ID , List<Field> time)async{
    
  return await teams.document(ID).updateData({'Finish':FieldValue.arrayUnion(time.map((e) => {'FinishTime':e.Finish_at}).toList())});
}
Future <void> duration(String ID , List<Field> time)async{
    
  return await teams.document(ID).updateData({'Duration':FieldValue.arrayUnion(time.map((e) =>{"Dur":e.Duration} ).toList())});
}

Future <void> removetimestart(String ID , List<Field> time)async{
    
  return await teams.document(ID).updateData({'Start':FieldValue.arrayRemove(time.map((e) => {'StartTime':e.Start_at}).toList())});
}
Future <void> removetimefinish(String ID , List<Field> time)async{
    
  return await teams.document(ID).updateData({'Finish':FieldValue.arrayRemove(time.map((e) => {'FinishTime':e.Finish_at}).toList())});
}
Future <void> removeduration(String ID , List<Field> time)async{
    
  return await teams.document(ID).updateData({'Duration':FieldValue.arrayRemove(time.map((e) => {'Dur':e.Duration}).toList())});
}
Future <void> joinLeague(String ID , List<League> team)async{
    
  return await teams.document(ID).updateData({'League':FieldValue.arrayUnion(team.map((e) => {'LeagueID': e.ID}).toList())});
}
Future <void> joinTeam(String ID , List<User> user)async{
    
  return await teams.document(ID).updateData({'Players':FieldValue.arrayUnion(user.map((e) => {'UserID': e.ID}).toList())});
}
Future <void> disjoinTeam(String ID , List<User> user)async{
    
  return await teams.document(ID).updateData({'Players':FieldValue.arrayRemove(user.map((e) => {'UserID': e.ID}).toList())});
}

  List<Team> _teamsFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Team(
      ID: doc.documentID,
      Date: doc.data['Date'] ?? '',
      Name:  doc.data['Name'] ?? '',
      NO_team :  doc.data['NO_Team'] ?? '',
      Photo:  doc.data['PhotoUrl'],
      //users: List.from(doc.data['Players']) ?? [],

      users: doc.data['Players'].map<User>((player) =>User.fromMap(player)).toList() ?? [],
    //  start_time:  doc.data['Start'].map<Field>((times) =>Field.fromMap(times)).toList() ?? [],
     // finish_time: doc.data['Finish'].map<Field>((timess) =>Field.fromMap2(timess)).toList() ?? [],
     // duration:  doc.data['Duration'].map<Field>((timesss) =>Field.fromMap3(timesss)).toList() ?? [],
      //  team: doc.data['League'].map<Team>((leg) =>Team.fromMap3(leg)).toList()?? []

 
     // rating: snapshot.data["Rating"],
    );
    }).toList();
  }

  Team _teamFromSnapshot(DocumentSnapshot snapshot) {
    return Team(
      ID: snapshot.documentID,
      Date: snapshot.data['Date'] ?? '',
      Name:  snapshot.data['Name'] ?? '',
      NO_team :  snapshot.data['NO_Team'] ?? '',
      Photo:  snapshot.data['PhotoUrl'],
      //users: List.from(doc.data['Players']) ?? [],

      users: snapshot.data['Players'].map<User>((player) =>User.fromMap(player)).toList() ?? [],
       start_time: snapshot.data['Start'].map<Field>((times) =>Field.fromMap(times)).toList() ?? [],
      finish_time: snapshot.data['Finish'].map<Field>((timess) =>Field.fromMap2(timess)).toList() ?? [],
      duration: snapshot.data['Duration'].map<Field>((timesss) =>Field.fromMap3(timesss)).toList() ?? [],
    //  team: snapshot.data['League'].map<Team>((leg) =>Team.fromMap3(leg)).toList()?? []

     // rating: snapshot.data["Rating"],
    );
  }
  

Stream<List<Team>> get teamz {
    return teams.where("Players" ,arrayContains: {'UserID' :userid}).snapshots().map(_teamsFromSnapshot);

  }
  Stream<List<Team>> get teamstojoin {
    return teams.snapshots().map(_teamsFromSnapshot);

  }
Stream<List<Team>> get members {
  
    return teams.where('ID' ,whereIn: leagueid).
    snapshots().map(_teamsFromSnapshot);

  }
  Stream<Team> get teamone {
    return teams.document(userid).snapshots().map(_teamFromSnapshot);

  }
  
  }