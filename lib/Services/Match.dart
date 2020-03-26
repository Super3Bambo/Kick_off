import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/User.dart';
class MatchService {


  

  final CollectionReference matches = Firestore.instance.collection('Match');

  
  Future<void> addMatch( String fieldid, String location  ,DateTime start ,DateTime finish ,String price, List<User> users ) async {
    return await matches.document().setData({
      'FieldId': fieldid,
      'Location': location,
      'Start_at': start ,
      'Finish_at': finish,
      'Price': price,
      'Date': DateTime.now(),
      'Players': users.map((u)=>{'UserID' :u.ID,}).toList(),
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
  

Stream<List<Match>> get matcheses {
    return matches.snapshots().map(_matchesFromSnapshot);

  }

}
