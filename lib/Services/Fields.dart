import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FieldService {


  

  final CollectionReference field = Firestore.instance.collection('Field');

  
  Future<void> addFieldData(String name, String cap, String location , String start ,String finish ,String price, bool ref , bool ball , bool bathroom  ) async {
    return await field.document().setData({
      'Name': name,
      'Capacitance': cap,
      'Location': location,
      'Start_at': start ,
      'Finish_at': finish,
      'Price': price,
       'Ball': true,
      'Bathroom': true,
      'Refree': false,
      
      /*'Rating': rating.map((r)=>{
        'Skills':r.Skills,
        'Morality':r.Morality,
        'Position_Skills':r.Position_Skills
      }).toList(),*/
      
    });
  }

  List<Field> _fieldDataFromSnapshot(QuerySnapshot snapshot) {
    return  snapshot.documents.map((doc){
    return Field(
      ID: doc.documentID,
      Name: doc.data['Name'] ?? '',
      Capacitance:  doc.data['Capacitance'] ?? '',
      Location :  doc.data['Location'] ?? '',
      Start_at:  doc.data['Start_at'] ?? '',
      Finish_at:  doc.data['Finish_at'] ?? '',
      Price :  doc.data['Price'] ?? '',
     // rating: snapshot.data["Rating"],
    );
    }).toList();
  }
  

Stream<List<Field>> get fieldses {
    return field.snapshots().map(_fieldDataFromSnapshot);
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