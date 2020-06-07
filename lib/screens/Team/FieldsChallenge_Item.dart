import 'package:flutter/material.dart';
import 'package:flutter_app/models/team.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/field.dart';
import 'package:flutter_app/screens/Team/FieldsChallenge_Details.dart';
import 'package:rating_bar/rating_bar.dart';

class FieldChallengeItem extends StatelessWidget {


  final Field fields;
  final Team teamid;

  FieldChallengeItem({ this.fields ,this.teamid});


  @override
  Widget build(BuildContext context) {
    int sum = 0;
    fields.rate.map((e) => e.Rate).forEach((int e){sum += e;});
    double count= sum/fields.rate.length;
godetails(Field id , Team ids){
Navigator.push(context,MaterialPageRoute(builder: (context)=> FieldDetailsTeam(fieldid: fields ,teamid:teamid )  ) );

}
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(

      margin:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),

      child: ClipRRect(

      borderRadius: BorderRadius.circular(20),

      child:Column(mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[


      ClipRRect(
      borderRadius: BorderRadius.circular(20),

      child:  GestureDetector(
          onTap: () => godetails(fields , teamid),
        child: Image.asset('images/5omasy.jpg', height: 200, width: 420, fit: BoxFit.cover, ),),

      ),
          InkWell(
          onTap: () => godetails(fields , teamid),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(10),

    child: Container(
    color :Color.fromRGBO(207, 243, 246, 100) ,
    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
    margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


    child: Padding(
    padding: const EdgeInsets.only(bottom: 20 , top: 10) ,


    child: Column(
    mainAxisAlignment:MainAxisAlignment.spaceBetween,
    mainAxisSize:MainAxisSize.max,
    crossAxisAlignment:CrossAxisAlignment.start,
    children: <Widget>[
      Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: <Widget>[
       RatingBar.readOnly(
    initialRating: count.floor().toDouble(),
    isHalfAllowed: true,
    halfFilledIcon: Icons.star_half,
    filledIcon: Icons.star,
    emptyIcon: Icons.star_border,
    ),
    IconButton(icon: Icon(FontAwesomeIcons.locationArrow , color: Colors.blue ,size: 25,), onPressed: null,)

    ]
    ),
    Container(
    margin: EdgeInsets.only(top:20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: <Widget>[

    Text('Name' +':' +fields.Name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
    Text('Price' + ':'+ fields.Price,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))  ,
    ]))



    ],


    ),
    )),
    ),
    )
    ],)

    )));
  }
}
