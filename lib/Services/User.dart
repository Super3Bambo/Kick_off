import '../models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {

  final String userid;
  UserService({ this.userid });
  

  final CollectionReference users = Firestore.instance.collection('user');

  Future<void> updateUserData(String fName, String lName, String age,String position ,String area,String phone, ) async {
    return await users.document(userid).setData({
      'FName': fName,
      'LName': lName,
      'Age': age,
      'Position': position ,
      'Area': area,
      'Phone': phone,
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
    );
  }
  
  Stream<User> get userData {
    return users.document(userid).snapshots()
      .map(_userDataFromSnapshot);
  }
  
  }