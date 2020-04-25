import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FieldService {

  final String fieldid;

  FieldService({this.fieldid});

  final CollectionReference field = Firestore.instance.collection('Field');

  
  Future<void> addFieldData(String name, String cap, String location ,String price, bool ref , bool ball , bool bathroom  ) async {
    List<Field> start; List <Field> finish ; List<Field> duration;
    return await field.document().setData({
      'Name': name,
      'Capacitance': cap,
      'Location': location,
      'Price': price,
       'Ball': true,
      'Bathroom': true,
      'Refree': false,
      'Start':  start.map((u)=>{'StartTime' :DateTime.now().toString(),}).toList(),
      'Finish': finish.map((u)=>{'FinishTime' :DateTime.now().toString(),}).toList(),
      'Duration': duration.map((u)=>{'Dur' :DateTime.now().toString(),}).toList(),
      /*'Rating': rating.map((r)=>{
        'Skills':r.Skills,
        'Morality':r.Morality,
        'Position_Skills':r.Position_Skills
      }).toList(),*/
      
    });
  }

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



     // rating: snapshot.data["Rating"],
    );
  }
  

Stream<List<Field>> get fieldses {
    return field.snapshots().map(_fieldDataFromSnapshot);
  }
  Stream<Field> get fieldd {
    return field.document(fieldid).snapshots().map(_onefieldDataFromSnapshot);
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