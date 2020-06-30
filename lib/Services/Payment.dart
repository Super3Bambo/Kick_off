import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Payment.dart';
import 'package:flutter_app/models/User.dart';


class PaymentService {
  final String payid;
  PaymentService({this.payid});

// final String userid,teamid, matchid , fieldid;
//   MatchService({ this.userid ,this.teamid, this.matchid ,this.fieldid});
  

  final CollectionReference matches = Firestore.instance.collection('Match');
  final CollectionReference payment = Firestore.instance.collection('Payment');

  Future<void> matchpay(String userid, String matchId, String EXP_Date ) async {
    return await payment.document().setData({
     'UserID':userid,
      'MatchId':matchId,
      'Date':EXP_Date,
      "Statue":false,
    });
  }

  Future<void> editMatchpay(String id, String fieldid,DateTime date, String location  ,String start ,String finish ,String price,  int counter , String topic) async {
    return await matches.document(id).updateData({
      'FieldId': fieldid,
      'Location': location,
      'Start_at': start ,
      'Finish_at': finish,
      'Topic':topic,
      'Price': price,
      'Counter':counter,
      'Date':date ,
      'Deleted':false,
  });
      
  }

  Future<void> editpay(String id, String userid, String matchId, String EXP_Date ) async {
    return await payment.document(id).setData({
     'UserID':userid,
      'MatchId':matchId,
      'Date':EXP_Date,
      "Statue":true,
    });
  }
   Future<void> deletepay(id) async {
    return await payment.document(id).delete();}

  Future <void> joinMatchpay(String ID , List<User> user)async{
    
  return await matches.document(ID).updateData({'Players':FieldValue.arrayUnion(user.map((e) => {'UserID': e.ID}).toList())});
}

   Payment onematchpayment(DocumentSnapshot snapshot) {
    return Payment(
       ID: snapshot.documentID,
      UserID: snapshot.data['UserID'] ?? '',
      MatchID :  snapshot.data['MatchId'] ?? '',
      EXPDate:  snapshot.data['Date'] ?? '',
      statue:snapshot.data['Statue']??'',
      
    );
  }

  List<Payment> matchpayment(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Payment(
      ID: doc.documentID,
      UserID: doc.data['UserID'] ?? '',
      MatchID :  doc.data['MatchId'] ?? '',
      EXPDate:  doc.data['Date'] ?? '',
       statue:doc.data['Statue']??'',
    );
    }).toList();
  }


  Stream<Payment> get matchpayments {
    return payment.document(payid).snapshots()
      .map(onematchpayment);
  }

  Stream<List<Payment>> get matchespayments {
  
    return payment.where('Statue' ,isEqualTo:false).where("Date" ,isGreaterThan: DateTime.now().toString()).
    snapshots().map(matchpayment);

  }
  
}