

class UserRating{
  int Skills;
  int Morality;
  int Position_Skills;

  UserRating({ this.Skills , this.Morality , this.Position_Skills});

   UserRating.fromMap(Map<dynamic, dynamic> data)
       : Skills = data['Skills'],Morality = data['Morality'], Position_Skills = data['Pos'];
        /*UserRating.fromMap2(Map<dynamic, dynamic> data)
       : Morality = data['Morality'];
        UserRating.fromMap3(Map<dynamic, dynamic> data)
       : Position_Skills = data['Pos'];*/
}