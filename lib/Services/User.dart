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

  Future<void> updateUserData(String fName, String lName, String age,String position ,String area,String phone, String imageurl,String teamid, String token , ) async {
        
    return await users.document(userid).updateData({
      'ID':userid,
      'FName': fName,
      'LName': lName,
      'Age': age,
      'Position': position ,
      'Role':"User",
      'Area': area,
      'Phone': phone,
      'Photo_Url' : imageurl,
      'TeamID':teamid,
      'Token':token,
    });
  }

  Future<void> addUserData(String fName, String lName, String age,String position, String photo ,String area,String phone, String token , List<Field> date  ,List<User> follow,List<UserRating> rating) async {
    return await users.document(userid).setData({
      'ID':userid,
      'FName': fName,
      'LName': lName,
      'Age': age,
      'Position': position ,
      'Area': area,
      'Token':token,
      'Role':"User",
      'Phone': phone,
      'Photo_Url':photo,
       'TeamID':'',
      'Start':  date.map((u)=>{'StartTime' :u.Date}).toList(),
      'Finish': date.map((u)=>{'FinishTime' :u.Date}).toList(),
      'Duration': date.map((u)=>{'Dur' :u.Date}).toList(),
      'Rating': rating.map((r)=>{
        'Skills':r.Skills,
        'Morality':r.Morality,
        'Pos':r.Position_Skills
      }).toList(),
      'Followers':follow.map((f)=>{'UserID': f.ID}).toList(),
      'Following':follow.map((f)=>{'UserID': f.ID}).toList(),

      
    });
  }

  Future <void> timestart(String ID , List<Field> time)async{
    
  return await users.document(ID).updateData({'Start':FieldValue.arrayUnion(time.map((e) =>{"StartTime": e.Start_at}).toList())});
}

 Future <void> rate(String ID , List<UserRating> rate)async{
    
  return await users.document(ID).updateData({'Rating':FieldValue.arrayUnion(rate.map((r) =>{ 'Skills':r.Skills,'Morality':r.Morality,'Pos':r.Position_Skills}).toList())});
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
      TeamID: snapshot.data['TeamID'],
      Token:snapshot.data['Token'] ,
      
      
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
      rating: doc.data['Rating'].map<UserRating>((skill)=>UserRating.fromMap(skill)).toList()?? [],
      duration: doc.data['Duration'].map<Field>((timesss) =>Field.fromMap3(timesss)).toList() ?? [],
      TeamID: doc.data['TeamID'],
      Token:doc.data['Token'],
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