import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/Matches.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/User.dart';

class MatchService {


  

  final CollectionReference field = Firestore.instance.collection('Match');

  
  Future<void> addMatch( String fieldid, String location ,String date ,String start ,String finish ,String price, List<User> users ) async {
    return await field.document().setData({
      'FieldId': fieldid,
      'Location': location,
      'Start_at': start ,
      'Finish_at': finish,
      'Price': price,
      'Date': date,
      'Players': users.map((u)=>{
        'UserID':u.ID,
      }).toList(),
      
    });
  }
}