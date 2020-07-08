import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/Request.dart';


class RequestService {
   final String reqid,teamid;
   RequestService({this.reqid ,this.teamid});


  final CollectionReference request = Firestore.instance.collection('Requests');

  Future<void> requesttojointeam(String userid, String teamid, String date ) async {
    return await request.document().setData({
     'UserID':userid,
      'TeamID':teamid,
      'Date':date,
      "Statue":false,
    });
  }
   Future<void> editrequesttojointeam(String id, String userid, String teamid, String date ) async {
    return await request.document(id).updateData({
     'UserID':userid,
      'TeamID':teamid,
      'Date':date,
      "Statue":true,
    });
  }

   Request onereq(DocumentSnapshot snapshot) {
    return Request(
       ID: snapshot.documentID,
      UserID: snapshot.data['UserID'] ?? '',
      TeamID :  snapshot.data['TeamID'] ?? '',
      Date:  snapshot.data['Date'] ?? '',
      Statue: snapshot.data['Statue']??','
      
    );
  }

  List<Request> listreq(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Request(
      ID: doc.documentID,
      UserID: doc.data['UserID'] ?? '',
      TeamID :  doc.data['TeamID'] ?? '',
      Date:  doc.data['Date'] ?? '',
      Statue: doc.data['Statue']??','
    );
    }).toList();
  }


  Stream<Request> get requestone {
    return request.document(reqid).snapshots()
      .map(onereq);
  }

  Stream<List<Request>> get requestlist {
  
    return request.where('TeamID' ,isEqualTo:teamid).where('Statue' , isEqualTo: false).
    snapshots().map(listreq);

  }
  
  }