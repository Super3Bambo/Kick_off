import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/team.dart';
import '../models/User.dart';
class MatchService {

final String userid,teamid;
  MatchService({ this.userid ,this.teamid});
  

  final CollectionReference matches = Firestore.instance.collection('Match');

  
  Future<void> addMatch( String fieldid, String location  ,String start ,String finish ,String price, List<User> users , ) async {
    return await matches.document().setData({
      'FieldId': fieldid,
      'Location': location,
      'Start_at': start ,
      'Finish_at': finish,
      'Price': price,
      'Counter': 1,
      'Challenge':false,
      'Date': DateTime.now(),
      'Players': users.map((u)=>{'UserID' :u.ID,}).toList(),
        //'Players' : users,
      // Map<String, dynamic>  {'Players': users}
  //   'Players': Match().mapping(),
  
  });
      
  }
 Future<void> addChallenge( String fieldid, String location  ,String start ,String finish ,String price, List<Team> teams , ) async {
    return await matches.document().setData({
      'FieldId': fieldid,
      'Location': location,
      'Start_at': start ,
      'Finish_at': finish,
      'Price': price,
      'Counter': 1,
      'Challenge':true,
      'Date': DateTime.now(),
      'Players': teams.map((u)=>{'UserID' :u.ID,}).toList(),
        //'Players' : users,
      // Map<String, dynamic>  {'Players': users}
  //   'Players': Match().mapping(),
  
  });
      
  }


  Future<void> editMatch(String id, String fieldid,DateTime date, String location  ,String start ,String finish ,String price,  int counter) async {
    return await matches.document(id).updateData({
      'FieldId': fieldid,
      'Location': location,
      'Start_at': start ,
      'Finish_at': finish,
      'Price': price,
      'Counter':counter,
      'Date':date ,
      //'Players': users.map((u)=>{'UserID' :u.ID,}).toList(),
        //'Players' : users,
      // Map<String, dynamic>  {'Players': users}
  //   'Players': Match().mapping(),
  
  });
      
  }

Future <void> joinMatch(String ID , List<User> user)async{
    
  return await matches.document(ID).updateData({'Players':FieldValue.arrayUnion(user.map((e) => {'UserID': e.ID}).toList())});
}

Future <void> disjoinMatch(String ID , List<User> user)async{
    
  return await matches.document(ID).updateData({'Players':FieldValue.arrayRemove(user.map((e) => {'UserID': e.ID}).toList())});
}


List<Match> _matchesFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Match(
      ID: doc.documentID,
      Date: doc.data['Date'] ?? '',
      Field:  doc.data['FieldId'] ?? '',
      Check_out :  doc.data['Finish_at'] ?? '',
      Check_in:  doc.data['Start_at'] ?? '',
      Location:  doc.data['Location'] ?? '',
      Challenge: doc.data['Challenge'],
      Price :  doc.data['Price'] ?? '',
      Counter: doc.data['Counter'] ?? '',
      //users: List.from(doc.data['Players']) ?? [],

      users: doc.data['Players'].map<User>((player) =>User.fromMap(player)).toList() ?? [],
      


     // rating: snapshot.data["Rating"],
    );
    }).toList();
  }
  List<Match> _challengesFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Match(
      ID: doc.documentID,
      Date: doc.data['Date'] ?? '',
      Field:  doc.data['FieldId'] ?? '',
      Check_out :  doc.data['Finish_at'] ?? '',
      Check_in:  doc.data['Start_at'] ?? '',
      Location:  doc.data['Location'] ?? '',
      Challenge: doc.data['Challenge'],
      Price :  doc.data['Price'] ?? '',
      Counter: doc.data['Counter'] ?? '',
      //users: List.from(doc.data['Players']) ?? [],

      team: doc.data['Players'].map<Team>((player) =>Team.fromMap(player)).toList() ?? [],


     // rating: snapshot.data["Rating"],
    );
    }).toList();
  }

  
  

Stream<List<Match>> get allmatches {
  
    return matches.where("Start_at" ,isGreaterThan: DateTime.now().toString()).where('Challenge' ,isEqualTo: false).
    snapshots().map(_matchesFromSnapshot);

  }
  Stream<List<Match>> get allchallenge {
  
    return matches.where("Players" ,arrayContains: {'UserID' :teamid}).
    where("Start_at" ,isGreaterThan: DateTime.now().toString()).
    where('Challenge' ,isEqualTo: true).
    snapshots().map(_challengesFromSnapshot);

  }
  

Stream<List<Match>> get matchcontaimuser {
  
    return matches.where("Players" ,arrayContains: {'UserID' :userid}).where("Start_at" ,isGreaterThan: DateTime.now().toString()).
    snapshots().map(_matchesFromSnapshot);

  }
Stream<List<Match>> get historymatches {
  
    return matches.where("Players" ,arrayContains: {'UserID' :userid}).
    where("Finish_at" ,isLessThan: DateTime.now().toString()).
    where("Counter" ,isEqualTo: 10).
    snapshots().map(_matchesFromSnapshot);

  }
  Stream<List<Match>> get completematches {
  
    return matches.where("Counter" ,isEqualTo: 10).where("Finish_at" ,isGreaterThan: DateTime.now().toString()).where('Challenge' ,isEqualTo: false).
    snapshots().map(_matchesFromSnapshot);

  }
}
