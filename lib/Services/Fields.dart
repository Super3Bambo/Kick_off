import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FieldService {

  final String fieldid , ownerid;

  FieldService({this.fieldid, this.ownerid});

  final CollectionReference field = Firestore.instance.collection('Field');

  Future<void> addFieldData(String name,  String location ,int price, bool ref , bool ball , bool bathroom , List<Field> time,List<FieldRating> rating  
  ,String start ,String end ,String owner, List<String> images) async {
    return await field.document().setData({
      'Name': name,
      'Owner':owner,
      'Capacitance': 10,
      'Location': location,
      'Price': price,
      'Starttime':start,
      'Endtime':end,
       'Ball': ball,
      'Bathroom': bathroom,
      'Refree': ref,
      'Images':images,
      'Start':  time.map((u)=>{'StartTime' :DateTime.now().toString(),}).toList(),
      'Finish': time.map((u)=>{'FinishTime' :DateTime.now().toString(),}).toList(),
      'Duration': time.map((u)=>{'Dur' :DateTime.now().toString(),}).toList(),
      'Rate': rating.map((r)=>{'Rates':r.Rate,}).toList(),
    });
  }

  Future<void> editFieldData(String name,  String location ,int price, bool ref , bool ball , bool bathroom , List<Field> starts , List<Field> finish,
  List<Field> dur,List<FieldRating> rating  ,String start ,String end ,String owner) async {
    return await field.document(fieldid).updateData({
      'Name': name,
      'Owner':owner,
      'Capacitance': 10,
      'Location': location,
      'Price': price,
      'Starttime':start,
      'Endtime':end,
      'Ball': ball,
      'Bathroom': bathroom,
      'Refree': ref,
      'Start':  starts.map((u)=>{'StartTime' :DateTime.now().toString(),}).toList(),
      'Finish': finish.map((u)=>{'FinishTime' :DateTime.now().toString(),}).toList(),
      'Duration': dur.map((u)=>{'Dur' :DateTime.now().toString(),}).toList(),
      'Rate': rating.map((r)=>{'Rates':r.Rate,}).toList(),
    });
  }
  Future<void> deleteField(id) async {
    return await field.document(id).delete();}

  Future <void> timestart(String ID , List<Field> time)async{
    
  return await field.document(ID).updateData({'Start':FieldValue.arrayUnion(time.map((e) => {'StartTime':e.Start_at}).toList())});
}
Future <void> timefinish(String ID , List<Field> time)async{
    
  return await field.document(ID).updateData({'Finish':FieldValue.arrayUnion(time.map((e) => {'FinishTime':e.Finish_at}).toList())});
}
Future <void> duration(String ID , List<Field> time)async{
    
  return await field.document(ID).updateData({'Duration':FieldValue.arrayUnion(time.map((e) => {'Dur':e.Duration}).toList())});
}
Future <void> removetimestart(String ID , List<Field> time)async{
    
  return await field.document(ID).updateData({'Start':FieldValue.arrayRemove(time.map((e) => {'StartTime':e.Start_at}).toList())});
}
Future <void> removetimefinish(String ID , List<Field> time)async{
    
  return await field.document(ID).updateData({'Finish':FieldValue.arrayRemove(time.map((e) => {'FinishTime':e.Finish_at}).toList())});
}
Future <void> removeduration(String ID , List<Field> time)async{
    
  return await field.document(ID).updateData({'Duration':FieldValue.arrayRemove(time.map((e) => {'Dur':e.Duration}).toList())});
}

Future <void> ratefield(String ID , List<FieldRating> rate)async{
    
  return await field.document(ID).updateData({'Rate':FieldValue.arrayUnion(rate.map((e) => {'Rates':e.Rate}).toList())});
}

  List<Field> _fieldDataFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Field(
      ID: doc.documentID,
      Name: doc.data['Name'] ?? '',
      Capacitance:  doc.data['Capacitance'] ?? '',
      Location :  doc.data['Location'] ?? '',
      Price :  doc.data['Price'] ?? '',
      start_time: doc.data['Start'].map<Field>((times) =>Field.fromMap(times)).toList() ?? [],
      finish_time: doc.data['Finish'].map<Field>((timess) =>Field.fromMap2(timess)).toList() ?? [],
      duration: doc.data['Duration'].map<Field>((timesss) =>Field.fromMap3(timesss)).toList() ?? [],
      rate: doc.data['Rate'].map<FieldRating>((rates) =>FieldRating.fromMap(rates)).toList() ?? [],
      images: List.from(doc.data['Images'])??[],
      Ball: doc.data['Ball'] ?? '',
      Refree: doc.data['Refree'] ?? '',
      Bathroom: doc.data['Bathroom'] ?? '',
      Finish_at: doc.data['Endtime'] ?? '',
      Start_at: doc.data['Starttime'] ?? '',
      Owner: doc.data["Owner"]??'',



     // rating: snapshot.data["Rating"],
    );
    }).toList();
  }

  Field _onefieldDataFromSnapshot(DocumentSnapshot snapshot) {
    return Field(
      ID: snapshot.documentID,
      Name: snapshot.data['Name'] ?? '',
      Capacitance:  snapshot.data['Capacitance'] ?? '',
      Location :  snapshot.data['Location'] ?? '',
      Price :  snapshot.data['Price'] ?? '',
      start_time: snapshot.data['Start'].map<Field>((times) =>Field.fromMap(times)).toList() ?? [],
      finish_time: snapshot.data['Finish'].map<Field>((timess) =>Field.fromMap2(timess)).toList() ?? [],
      duration: snapshot.data['Duration'].map<Field>((timesss) =>Field.fromMap3(timesss)).toList() ?? [],
      rate:snapshot.data['Rate'].map<FieldRating>((rates) =>FieldRating.fromMap(rates)).toList() ?? [],
      images: List.from(snapshot.data['Images'])??[],
      Ball: snapshot.data['Ball'] ?? '',
      Refree: snapshot.data['Refree'] ?? '',
      Bathroom: snapshot.data['Bathroom'] ?? '',
      Finish_at: snapshot.data['Endtime'] ?? '',
      Start_at: snapshot.data['Starttime'] ?? '',
       Owner: snapshot.data["Owner"]??'',
       




     // rating: snapshot.data["Rating"],
    );
  }
  

Stream<List<Field>> get fieldses {
    return field.snapshots().map(_fieldDataFromSnapshot);
  }
  Stream<Field> get fieldd {
    return field.document(fieldid).snapshots().map(_onefieldDataFromSnapshot);
  }
  Stream<List<Field>> get fieldsowner {
    return field.where('Owner', isEqualTo: ownerid).snapshots().map(_fieldDataFromSnapshot);
  }
  /*
  Field _onefieldDataFromSnapshot(DocumentSnapshot snapshot) {
    return Field(
      Name: snapshot.data['Name'] ?? '',
      Capacitance:  snapshot.data['Capacitance'] ?? '',
      Location :  snapshot.data['Location'] ?? '',
      Start_at:  snapshot.data['Start_at'] ?? '',
      Finish_at:  snapshot.data['Finish_at'] ?? '',
      Price :  snapshot.data['Price'] ?? '',
     // rating: snapshot.data["Rating"],
    );
  }

   
  Stream<Field> get userData {
    return field.document().snapshots()
      .map(_onefieldDataFromSnapshot);
  }
  /*Future getfields() async {
    var filestore = Firestore.instance;
    QuerySnapshot docs = await filestore.collection('Field').getDocuments();
    return docs.documents;
  }
  */*/
  }