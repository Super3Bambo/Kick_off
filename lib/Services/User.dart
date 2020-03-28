import 'package:flutter_app/models/Rating.dart';
import '../models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {

  final String userid;
  UserService({ this.userid });
  

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

  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      ID: userid,
      FName: snapshot.data['FName'],
      Age: snapshot.data['Age'],
      Position : snapshot.data['Position'],
      LName: snapshot.data['LName'],
      Phone: snapshot.data['Phone'],
      Area : snapshot.data['Area'],
      Photo_url: snapshot.data['Photo_Url']
     // rating: snapshot.data["Rating"],
      
    );
  }
  
  Stream<User> get userData {
    return users.document(userid).snapshots()
      .map(_userDataFromSnapshot);
  }
  
  }