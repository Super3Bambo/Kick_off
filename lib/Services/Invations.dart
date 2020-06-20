import 'package:flutter_app/models/Invite.dart';
import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InviteService {
  String inviteid , userid;

InviteService({this.inviteid ,this.userid});


  final CollectionReference invite = Firestore.instance.collection('Invite');

  Future<void> sendinvitematch(String sendId,  String recieveId ,String matchId, String EXP_Date ) async {
    return await invite.document().setData({
     'Sender':sendId,
     'Reciever':recieveId,
      'MatchId':matchId,
      'Date':EXP_Date,
      'Type':'Match',
    });
  }

  Future<void> sendinviteteam(String sendId,  String recieveId ,String matchId, String EXP_Date ) async {
    return await invite.document().setData({
     'Sender':sendId,
     'Reciever':recieveId,
      'MatchId':matchId,
      'Date':EXP_Date,
      'Type':'Team',
    });
  }

  Invite oneinvite(DocumentSnapshot snapshot) {
    return Invite(
       ID: snapshot.documentID,
      Sender: snapshot.data['Sender'] ?? '',
      Reciever:  snapshot.data['Reciever'] ?? '',
      MatchID :  snapshot.data['MatchId'] ?? '',
      EXPDate:  snapshot.data['Date'] ?? '',
      Type:snapshot.data['Type']??'',
      
    );
  }

  List<Invite> userinvitelist(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Invite(
      ID: doc.documentID,
      Sender: doc.data['Sender'] ?? '',
      Reciever:  doc.data['Reciever'] ?? '',
      MatchID :  doc.data['MatchId'] ?? '',
      EXPDate:  doc.data['Date'] ?? '',
       Type:doc.data['Type']??'',
    );
    }).toList();
  }
   Stream<Invite> get invites {
    return invite.document(inviteid).snapshots()
      .map(oneinvite);
  }

  Stream<List<Invite>> get userinvite {
  
    return invite.where('Reciever' ,isEqualTo:userid).where("Date" ,isGreaterThan: DateTime.now().toString()).
    snapshots().map(userinvitelist);

  }
  
  
  }