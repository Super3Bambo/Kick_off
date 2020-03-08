import 'package:flutter/material.dart';
import '../models/field.dart';

class Fields with ChangeNotifier{
List<Field> fields = [ 
  Field(ID: '1' , Name: 'wadi degla' , Capacitance: '7' , Location: 'maddi' , Start_at: '09:00:00' , Finish_at: '23:00:00', Price: '150', 
  Photo_url: 'images/5omasy.jpg' , Ball: true , Bathroom: true , Refree: false),

  Field(ID: '2' , Name: 'Zamalek' , Capacitance: '7' , Location: 'El tagmoaa' , Start_at: '09:00:00' , Finish_at: '23:00:00',Price: '200', 
  Photo_url: 'images/5omasy.jpg' , Ball: true , Bathroom: true , Refree: false ),

  Field(ID: '3' , Name: 'Ittihad' , Capacitance: '5' , Location: 'el zahraa' , Start_at: '09:00:00' , Finish_at: '23:00:00',Price: '300',
   Photo_url: 'images/5omasy.jpg' , Ball: true , Bathroom: true , Refree: false),

  Field(ID: '4' , Name: 'Alahly' , Capacitance: '7' , Location: 'fisaal' , Start_at: '09:00:00' , Finish_at: '23:00:00',Price: '150', 
  Photo_url: 'images/5omasy.jpg' , Ball: true , Bathroom: true , Refree: false),

  Field(ID: '5' , Name: 'Sundowns' , Capacitance: '7' , Location: 'eldarb elahmer' , Start_at: '09:00:00' , Finish_at: '23:00:00',Price: '100', 
  Photo_url: 'images/5omasy.jpg' , Ball: true , Bathroom: true , Refree: false),

  Field(ID: '1' , Name: 'wadi degla' , Capacitance: '7' , Location: 'maddi' , Start_at: '09:00:00' , Finish_at: '23:00:00', Price: '150', Photo_url: 'images/5omasy.jpg'
  , Ball: true , Bathroom: true , Refree: false),

  Field(ID: '2' , Name: 'Zamalek' , Capacitance: '7' , Location: 'El tagmoaa' , Start_at: '09:00:00' , Finish_at: '23:00:00',Price: '200', Photo_url: 'images/5omasy.jpg', 
  Ball: true , Bathroom: true , Refree: false),

  Field(ID: '3' , Name: 'Ittihad' , Capacitance: '5' , Location: 'el zahraa' , Start_at: '09:00:00' , Finish_at: '23:00:00',Price: '300', Photo_url: 'images/5omasy.jpg'
  , Ball: true , Bathroom: true , Refree: false),

  Field(ID: '4' , Name: 'Alahly' , Capacitance: '7' , Location: 'fisaal' , Start_at: '09:00:00' , Finish_at: '23:00:00',Price: '150', Photo_url: 'images/5omasy.jpg'
  , Ball: true , Bathroom: true , Refree: false),
  
  Field(ID: '5' , Name: 'Sundowns' , Capacitance: '7' , Location: 'eldarb elahmer' , Start_at: '09:00:00' , Finish_at: '23:00:00',Price: '100', Photo_url: 'images/5omasy.jpg'
  , Ball: true , Bathroom: true , Refree: false),
  ];


List<Field> get fieldsLists => [...fields];

  Field findById(String id) {
    return fields.firstWhere((prod) => prod.ID == id);
  }

void addField() {
  //fields.add(value);
notifyListeners();
}

}