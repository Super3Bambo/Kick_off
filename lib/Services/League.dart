import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';



class LeagueService {
  String teamid , id , i;
  LeagueService({this.teamid, this.id , this.i});


final CollectionReference league = Firestore.instance.collection('League');


  Future<void> addleague( String fieldid, String start ,String finish , List<Team> teams , String prize , String desc,String name ) async {
    return await league.document().setData({
      'FieldId': fieldid,
      'Start_at': start ,
      'Finish_at': finish,
      'Description': desc,
      'Prize':prize,
      'Name':name,
      'Teams': teams.toList(),
        //'Players' : users,
      // Map<String, dynamic>  {'Players': users}
  //   'Players': Match().mapping(),
  
  });
  }
  Future<void> updateleague( String fieldid, String start ,String finish , String prize , String desc,String name, List<Team> teams ) async {
    return await league.document(id).setData({
      'FieldId': fieldid,
      'Start_at': start ,
      'Finish_at': finish,
      'Description': desc,
      'Prize':prize,
      'Name':name,
      'Counter':8,
      'Teams': teams.map((u)=>{'TeamID' :u.ID,}).toList(),

        //'Players' : users,
      // Map<String, dynamic>  {'Players': users}
  //   'Players': Match().mapping(),
  
  });
  }
  
Future<void> addmatch_to_league( String fieldid, String start ,String finish , List<Team> teams ) async {
    return await league.document(id).collection(teamid).document(i).setData({
      'FieldId': fieldid,
      'Start_at': start,
      'Finish_at': finish,
      'Teams': teams.map((u)=>{'TeamID' :u.ID,}).toList(),
  });
  }

  Future <void> joinmatchLeague(List<Team> team)async{
    
  return await league.document(id).collection(teamid).document(i).updateData({'Teams':FieldValue.arrayUnion(team.map((e) => {'TeamID': e.ID}).toList())});
}

  Future <void> joinLeague(String ID , List<Team> team)async{
    
  return await league.document(ID).updateData({'Teams':FieldValue.arrayUnion(team.map((e) => {'TeamID': e.ID}).toList())});
}

Future <void> disjoinLeague(String ID , List<Team> team)async{
    
  return await league.document(ID).updateData({'Teams':FieldValue.arrayRemove(team.map((e) => {'TeamID': e.ID}).toList())});
}

  List<League> _leaguesFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return League(
      ID: doc.documentID,
      Field:  doc.data['FieldId'] ?? '',
      Finish_Date :  doc.data['Finish_at'] ?? '',
      Start_Date:  doc.data['Start_at'] ?? '',
      Description: doc.data['Description'] ?? '',
      Prize: doc.data['Prize'],
      Name: doc.data['Name'],
      teams: doc.data['Teams'].map<Team>((team) =>Team.fromMap2(team)).toList() ?? [],


    );
    }).toList();
  }

  Stream<List<League>> get leagues {
  
    return league.where("Start_at" ,isGreaterThan: DateTime.now().toString()).
    snapshots().map(_leaguesFromSnapshot);

  }
}