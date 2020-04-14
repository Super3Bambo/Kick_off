import 'package:flutter_app/models/Rating.dart';
import '../models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {

  final String userid;
  List<String> user;
  List<String> usr;
  List<String> usrteam;
  UserService({ this.userid,this.user,this.usr ,this.usrteam});
  

  final CollectionReference users = Firestore.instance.collection('user');

  Future<void> updateUserData(String fName, String lName, String age,String position ,String area,String phone, String imageurl ) async {
        
    return await users.document(userid).updateData({
      'FName': fName,
      'LName': lName,
      'Age': age,
      'Position': position ,
      'Area': area,
      'Phone': phone,
      'Photo_Url' : imageurl
    });
  }

  Future<void> addUserData(String fName, String lName, String age,String position ,String area,String phone,  ) async {
    return await users.document(userid).setData({
      'FName': fName,
      'LName': lName,
      'Age': age,
      'Position': position ,
      'Area': area,
      'Phone': phone,
      /*'Rating': rating.map((r)=>{
        'Skills':r.Skills,
        'Morality':r.Morality,
        'Position_Skills':r.Position_Skills
      }).toList(),*/
      
    });
  }

  Future <void> follow(String ID , List<User> user)async{
    
  return await users.document(ID).updateData({'Following':FieldValue.arrayUnion(user.map((e) => {'UserID': e.ID}).toList())});
}

Future <void> follower(String ID , List<User> user)async{
    
  return await users.document(ID).updateData({'Followers':FieldValue.arrayUnion(user.map((e) => {'UserID': e.ID}).toList())});
}

Future <void> unfollow(String ID , List<User> user)async{
    
  return await users.document(ID).updateData({'Followers':FieldValue.arrayRemove(user.map((e) => {'UserID': e.ID}).toList())});
}

Future <void> unefollow(String ID , List<User> user)async{
    
  return await users.document(ID).updateData({'Following':FieldValue.arrayRemove(user.map((e) => {'UserID': e.ID}).toList())});
}

  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      ID: userid,
      FName: snapshot.data['FName'],
      Age: snapshot.data['Age'],
      Position : snapshot.data['Position'],
      LName: snapshot.data['LName'],
      Phone: snapshot.data['Phone'],
      Area : snapshot.data['Area'],
      Photo_url: snapshot.data['Photo_Url'],
      followerusers: snapshot.data['Followers'].map<User>((user) =>User.fromMap(user)).toList() ?? [],
      followingusers: snapshot.data['Following'].map<User>((user) =>User.fromMap(user)).toList() ?? [],
     // rating: snapshot.data["Rating"],
      
    );
  }

  List<User> _usersFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return User(
      ID: doc.documentID,
      FName: doc.data['FName'] ?? '',
      LName:  doc.data['LName'] ?? '',
      Position :  doc.data['Position'] ?? '',
      Phone:  doc.data['Phone'] ?? '',
      Photo_url:  doc.data['Photo_Url'] ?? '',
      Area:doc.data['Area'] ?? '' ,
      Age :  doc.data['Age'] ?? '',
      followerusers: doc.data['Followers'].map<User>((user) =>User.fromMap(user)).toList() ?? [],
      followingusers: doc.data['Following'].map<User>((user) =>User.fromMap(user)).toList() ?? [],
    );
    }).toList();
  }
  
Stream<List<User>> get teammember {
  
    return users.where('ID' , whereIn:  usrteam ).
    snapshots().map(_usersFromSnapshot);

  }

  Stream<List<User>> get friends {
  
    return users.where('ID' , whereIn:  usr ).
    snapshots().map(_usersFromSnapshot);

  }

Stream<List<User>> get members {
  
    return users.where('ID' , whereIn: user).
    snapshots().map(_usersFromSnapshot);

  }

  Stream<User> get userData {
    return users.document(userid).snapshots()
      .map(_userDataFromSnapshot);
  }
  
  }