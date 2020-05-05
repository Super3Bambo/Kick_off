import 'package:flutter_app/models/Rating.dart';
import 'package:flutter_app/models/field.dart';
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
      'ID':userid,
      'FName': fName,
      'LName': lName,
      'Age': age,
      'Position': position ,
      'Role':"User",
      'Area': area,
      'Phone': phone,
      'Photo_Url' : imageurl
    });
  }

  Future<void> addUserData(String fName, String lName, String age,String position ,String area,String phone, ) async {
    List<Field> start; List <Field> finish ; List<Field> duration;
    List<UserRating> rating;
    return await users.document(userid).setData({
      'FName': fName,
      'LName': lName,
      'Age': age,
      'Position': position ,
      'Area': area,
      'Role':"User",
      'Phone': phone,
      'Start':  start.map((u)=>{'StartTime' :DateTime.now().toString(),}).toList(),
      'Finish': finish.map((u)=>{'FinishTime' :DateTime.now().toString(),}).toList(),
      'Duration': duration.map((u)=>{'Dur' :DateTime.now().toString(),}).toList(),
      'Rating': rating.map((r)=>{
        'Skills':r.Skills=0,
        'Morality':r.Morality=0,
        'Position_Skills':r.Position_Skills=0
      }).toList()
      
    });
  }

  Future <void> timestart(String ID , List<Field> time)async{
    
  return await users.document(ID).updateData({'Start':FieldValue.arrayUnion(time.map((e) =>{"StartTime": e.Start_at}).toList())});
}
Future <void> timefinish(String ID , List<Field> time)async{
    
  return await users.document(ID).updateData({'Finish':FieldValue.arrayUnion(time.map((e) => {'FinishTime':e.Finish_at}).toList())});
}
Future <void> duration(String ID , List<Field> time)async{
    
  return await users.document(ID).updateData({'Duration':FieldValue.arrayUnion(time.map((e) =>{"Dur":e.Duration} ).toList())});
}

Future <void> removetimestart(String ID , List<Field> time)async{
    
  return await users.document(ID).updateData({'Start':FieldValue.arrayRemove(time.map((e) => {'StartTime':e.Start_at}).toList())});
}
Future <void> removetimefinish(String ID , List<Field> time)async{
    
  return await users.document(ID).updateData({'Finish':FieldValue.arrayRemove(time.map((e) => {'FinishTime':e.Finish_at}).toList())});
}
Future <void> removeduration(String ID , List<Field> time)async{
    
  return await users.document(ID).updateData({'Duration':FieldValue.arrayRemove(time.map((e) => {'Dur':e.Duration}).toList())});
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
      Role:snapshot.data['Role'],
      Photo_url: snapshot.data['Photo_Url'],
      followerusers: snapshot.data['Followers'].map<User>((user) =>User.fromMap(user)).toList() ?? [],
      followingusers: snapshot.data['Following'].map<User>((user) =>User.fromMap(user)).toList() ?? [],
      start_time: snapshot.data['Start'].map<Field>((times) =>Field.fromMap(times)).toList() ?? [],
      finish_time: snapshot.data['Finish'].map<Field>((timess) =>Field.fromMap2(timess)).toList() ?? [],
      duration: snapshot.data['Duration'].map<Field>((timesss) =>Field.fromMap3(timesss)).toList() ?? [],
      rating: snapshot.data['Rating'].map<UserRating>((skill)=>UserRating.fromMap(skill)).toList()?? [],
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
      start_time: doc.data['Start'].map<Field>((times) =>Field.fromMap(times)).toList() ?? [],
      finish_time: doc.data['Finish'].map<Field>((timess) =>Field.fromMap2(timess)).toList() ?? [],
      duration: doc.data['Duration'].map<Field>((timesss) =>Field.fromMap3(timesss)).toList() ?? [],
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