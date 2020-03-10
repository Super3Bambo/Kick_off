/*import '../models/Matches.dart';
import 'package:flutter/foundation.dart';

class matches with ChangeNotifier{

  
  Map<String, Match> match = {};

  Map<String, Match> get matchs {
    return {...match};
  }

  int get itemCount {
    return match.length;
  }

  void addmatch(
    String userid,
    String fieldid,
    String price,
  ) {
    if (match.containsKey(userid)) {
      // change quantity...
      match.update(
        userid,
        (existinguser) => Match(
             
            ),
      );
    } else {
      match.putIfAbsent(
        userid,
        () => Match(
              ID: DateTime.now().toString(),
              field: fieldid,
              Price: price,
              Date: DateTime.now(),
              Check_in: DateTime.now(),
              Check_out: DateTime.now(),
            ),
      );
    }
    notifyListeners();
  }


 
}*/