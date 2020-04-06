import 'package:flutter_app/models/RatingField.dart';
import '../models/team.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/User.dart';
class TeamService {


  

  final CollectionReference teams = Firestore.instance.collection('Team');

   Team _teamFromFirebase(DocumentSnapshot team) {
    return team != null ? Team(ID: team.documentID) : null;
  }


  Future<void> createTeam(  String name ,String nO_Team, List<User> users , String counter ) async {
    return await teams.document().setData({
      'Date': DateTime.now(),
      'Name':name ,
      'Counter' : counter,
      'NO_Team': nO_Team ,
      'Players': users.map((u)=>{'UserID' :u.ID,}).toList(),
      
  });    
  }
  
  List<Team> _teamsFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Team(
      ID: doc.documentID,
      Date: doc.data['Date'] ?? '',
      Name:  doc.data['Name'] ?? '',
      NO_team :  doc.data['NO_Team'] ?? '',
      //users: List.from(doc.data['Players']) ?? [],

      users: doc.data['Players'].map<User>((player) =>User.fromMap(player)).toList() ?? [],


     // rating: snapshot.data["Rating"],
    );
    }).toList();
  }
  

Stream<List<Team>> get teamz {
    return teams.snapshots().map(_teamsFromSnapshot);

  }
  
  }