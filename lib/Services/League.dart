import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/LeagueMatches.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_app/models/team.dart';



class LeagueService {
  String teamid , id , i,ownerid , leagueid;
  LeagueService({this.teamid, this.id , this.i ,this.ownerid , this.leagueid});


final CollectionReference league = Firestore.instance.collection('League');


  Future<void> addleague( String fieldid, String start ,String finish , List<Team> teams , String prize , String desc,String name ,String owner , String location ,String topic) async {
    return await league.document().setData({
      'FieldId': fieldid,
      'Start_at': start ,
      'Finish_at': finish,
      'Description': desc,
      'Prize':prize,
      'Name':name,
      'Owner':owner,
      'Teams': teams.toList(),
      'Location':location,
      'Topic':topic,
        //'Players' : users,
      // Map<String, dynamic>  {'Players': users}
  //   'Players': Match().mapping(),
  
  });
  }
  Future<void> updateleague( String fieldid, String start ,String finish , String prize , String desc,String name ,String owner) async {
    return await league.document(leagueid).updateData({
      'FieldId': fieldid,
      'Start_at': start ,
      'Finish_at': finish,
      'Description': desc,
      'Prize':prize,
      'Name':name,
      'Owner':owner,
  });
  }

  Future<void> deleteLeague() async {
    return await league.document(leagueid).delete();}

    
  // Future<void> updateleague( String fieldid, String start ,String finish , String prize , String desc,String name, List<Team> teams ) async {
  //   return await league.document(id).setData({
  //     'FieldId': fieldid,
  //     'Start_at': start ,
  //     'Finish_at': finish,
  //     'Description': desc,
  //     'Prize':prize,
  //     'Name':name,
  //     'Counter':8,
  //     'Teams': teams.map((u)=>{'TeamID' :u.ID,}).toList(),

  //       //'Players' : users,
  //     // Map<String, dynamic>  {'Players': users}
  // //   'Players': Match().mapping(),
  
  // });
  // }
  
Future<void> addmatch_to_league( String fieldid, String start ,String finish , List<Team> teams ,String location ) async {
    return await league.document(id).collection(teamid).document(i).setData({
      'FieldId': fieldid,
      'Start_at': start,
      'Finish_at': finish,
      'Location':location,
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
      Owner:doc.data['Owner'],
      Field:  doc.data['FieldId'] ?? '',
      Finish_Date :  doc.data['Finish_at'] ?? '',
      Start_Date:  doc.data['Start_at'] ?? '',
      Description: doc.data['Description'] ?? '',
      Prize: doc.data['Prize'],
      Name: doc.data['Name'],
      Location: doc.data['Location'],
      Topic: doc.data['Topic'],
      teams: doc.data['Teams'].map<Team>((team) =>Team.fromMap2(team)).toList() ?? [],


    );
    }).toList();
  }

  List<LeagueMatch> _LeagueMatchesFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return LeagueMatch(
      ID: doc.documentID,
      Field:  doc.data['FieldId'] ?? '',
      Check_out :  doc.data['Finish_at'] ?? '',
      Check_in:  doc.data['Start_at'] ?? '',
      Location: doc.data['Location'],
      
      //Location:  doc.data['Location'] ?? '',
      team: doc.data['Teams'].map<Team>((player) =>Team.fromMap(player)).toList() ?? [],


     // rating: snapshot.data["Rating"],
    );
    }).toList();
  }

  Stream<List<League>> get leagues {
  
    return league.where("Start_at" ,isGreaterThan: DateTime.now().toString()).
    snapshots().map(_leaguesFromSnapshot);

  }
   Stream<List<League>> get leaguesteam {
  
    return league.where("Start_at" ,isGreaterThan: DateTime.now().toString()).where("Teams", arrayContains: {'TeamID' :teamid}).
    snapshots().map(_leaguesFromSnapshot);

  }
   Stream<List<League>> get leaguesowner {
  
    return league.where('Owner' , isEqualTo: ownerid).
    snapshots().map(_leaguesFromSnapshot);

  }
  Stream<List<LeagueMatch>> get leagueMatches {
  
    return league.document(leagueid).collection(leagueid+'match').snapshots().map(_LeagueMatchesFromSnapshot);
    
  
    // snapshots().map(_leaguesFromSnapshot);

  }
  Stream<List<LeagueMatch>> get leagueMYMatch {
  
    return league.document(leagueid).collection(leagueid+'match').where('Teams' ,arrayContains: {'TeamID':teamid} ).
    orderBy('Start_at' , descending: false).snapshots().map(_LeagueMatchesFromSnapshot);
    
  
    // snapshots().map(_leaguesFromSnapshot);

  }
}