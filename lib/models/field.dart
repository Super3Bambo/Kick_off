import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import './RatingField.dart';

class Field  {
  

   String ID;
   String Name;
   String Capacitance;
   String Location;
   String Start_at;
   String Finish_at;
   String Duration;
   String Price;
   String Date;
   String Photo_url;
   bool  Ball;
   bool  Bathroom;
   bool  Refree;
   List<Field> start_time;
  List<Field> finish_time;
  List<Field> duration;
  List<FieldRating> rate;


  Field ({ this.ID, this.Name , this.Capacitance , this.Date, this.Location , this.Start_at , this.Price ,  this.Finish_at,this.Duration  ,this.Photo_url , this.Ball , 
  this.Bathroom , this.Refree , this.start_time , this.finish_time , this.duration , this.rate});
    Field.fromMap(Map<dynamic, dynamic> data)
       : Start_at = data['StartTime'];
    Field.fromMap2(Map<dynamic, dynamic> data)
       : Finish_at = data['FinishTime'];
    Field.fromMap3(Map<dynamic, dynamic> data)
       : Duration = data['Dur'];
      
}
