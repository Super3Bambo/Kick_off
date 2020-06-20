import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import './RatingField.dart';

class Invite  {
  

   String ID;
   String Sender;
   String Reciever;
   String MatchID;
   String EXPDate;
   String Type;
  

  Invite ({ this.ID, this.Sender   , this.Reciever , this.MatchID , this.EXPDate , this.Type});

}