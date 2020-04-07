import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/User.dart';
class MatchService {

final String userid;
  MatchService({ this.userid });
  

  final CollectionReference matches = Firestore.instance.collection('Match');

  
  Future<void> addMatch( String fieldid, String location  ,DateTime start ,DateTime finish ,String price, List<User> users , String counter) async {
    return await matches.document().setData({
      'FieldId': fieldid,
      'Location': location,
      'Start_at': start ,
      'Finish_at': finish,
      'Price': price,
      'Counter': counter,
      'Date': DateTime.now(),
      'Players': users.map((u)=>{'UserID' :u.ID,}).toList(),
        //'Players' : users,
      // Map<String, dynamic>  {'Players': users}
  //   'Players': Match().mapping(),
  
  });
      
  }
  Future<void> editMatch(String id, String fieldid,DateTime date, String location  ,DateTime start ,DateTime finish ,String price,  String counter) async {
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


List<Match> _matchesFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Match(
      ID: doc.documentID,
      Date: doc.data['Date'] ?? '',
      Field:  doc.data['FieldId'] ?? '',
      Check_out :  doc.data['Finish_at'] ?? '',
      Check_in:  doc.data['Start_at'] ?? '',
      Location:  doc.data['Location'] ?? '',
      Price :  doc.data['Price'] ?? '',
      //users: List.from(doc.data['Players']) ?? [],

      users: doc.data['Players'].map<User>((player) =>User.fromMap(player)).toList() ?? [],


     // rating: snapshot.data["Rating"],
    );
    }).toList();
  }

  
  

Stream<List<Match>> get allmatches {
  
    return matches.where("Start_at" ,isLessThan: DateTime.now()).
    snapshots().map(_matchesFromSnapshot);

  }
  

Stream<List<Match>> get matchcontaimuser {
  
    return matches.where("Players" ,arrayContains: {'UserID' :userid}).where("Start_at" ,isLessThan: DateTime.now()).
    snapshots().map(_matchesFromSnapshot);

  }
Stream<List<Match>> get historymatches {
  
    return matches.where("Players" ,arrayContains: {'UserID' :userid}).
    where("Finish_at" ,isLessThan: DateTime.now()).
    where("Counter" ,isEqualTo: '9').
    snapshots().map(_matchesFromSnapshot);

  }
  Stream<List<Match>> get completematches {
  
    return matches.where("Counter" ,isEqualTo: '9').
    snapshots().map(_matchesFromSnapshot);

  }
}
