

class FieldRating{
  int Rate;
  
  FieldRating({ this.Rate});
    FieldRating.fromMap(Map<dynamic, dynamic> data)
       : Rate = data['Rates'];
}