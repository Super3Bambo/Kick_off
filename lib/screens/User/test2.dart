import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/screens/User/FollowingDetails.dart';
import 'package:rating_bar/rating_bar.dart';



class PlanetRow extends StatelessWidget {
  final User following;
  PlanetRow({ this.following });
  
    @override
  Widget build(BuildContext context) {
     godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Following_Details(userid: following)  ) );}
    int sumskills = 0;
    int sumMorality = 0;
    int sumPos = 0;
      following.rating.map((e) => e.Skills).forEach((int e){sumskills += e;});
      double skillscount= sumskills/following.rating.length;   
       following.rating.map((e) => e.Morality).forEach((int e){sumMorality += e;});
      double moralitycount= sumMorality/following.rating.length;   
       following.rating.map((e) => e.Position_Skills).forEach((int e){sumPos += e;});
      double poscount= sumPos/following.rating.length;   
      double total =(skillscount*6+moralitycount*2+poscount)/(3*3);
    return new Container(
      
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: InkWell(
        onTap: (){godetails(following);},
              child: new Stack(
          children: <Widget>[
            Container(
    height: 135.0,
    width: 370,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(  
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
    ),
    child:  Container(
        margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(following.FName + ' '+following.LName,
              style: headerTextStyle,
            ),
            RatingBar.readOnly(
                      initialRating: total,
                      isHalfAllowed: true,
                      halfFilledIcon: Icons.star_half,
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      filledColor:Color.fromRGBO(243, 93, 68, 100),
                      emptyColor: Color.fromRGBO(243, 93, 66, 100),
                      halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
                    ),
                   // new Container(height: 6.0),
            new Row(
              children: <Widget>[
               Icon( 
                      Icons.assignment,
                       size: 16.0,
                      color:  Color(0xffb6b2df),        
                   ),              
                new Container(width: 8.0),
                new Text(following.Position,
                  style: regularTextStyle,
                ),
                new Container(width: 24.0),
                        Icon( 
                      Icons.assignment,
                       size: 16.0,
                      color:  Color(0xffb6b2df),
                                        
                   ),              
                  new Container(width: 8.0),
                new Text(following.Age,
                  style: regularTextStyle,
                ),
              ],
            ),
          ],
        ),
    ),
  ),
            Container(
    margin: new EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,

    ),
    alignment: FractionalOffset.centerLeft,
    
    child:  CircleAvatar(
                     backgroundColor:  Colors.blueGrey,
                      radius: 50,
                      child: ClipOval(
                        
                     child: SizedBox(
                          width: 85.0,
                          height: 85.0,
                            child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
                    //backgroundImage: NetworkImage(imgUrl),
                            
                   
                   ),
                   ),
                   ),
  ),
          ],
        ),
      )
    );
  }
}
final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
    );
    final headerTextStyle = baseTextStyle.copyWith(
     // color: const Colors.white,
     color:  Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
    );
     final regularTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 17.0,
      fontWeight: FontWeight.bold
    );
// final planetThumbnail = new Container(
//     margin: new EdgeInsets.only(
//       top: 16.0,
//       bottom: 16.0,

//     ),
//     alignment: FractionalOffset.centerLeft,
    
//     child:  CircleAvatar(
//                    backgroundColor:  Colors.blueGrey,
//                     radius: 50,
//                     child: ClipOval(
                      
//                    child: SizedBox(
//                         width: 85.0,
//                         height: 85.0,
//                           child: Image.network('images/5omasy.jpg' , fit: BoxFit.fill, ),
//                   //backgroundImage: NetworkImage(imgUrl),
                          
                 
//                  ),
//                  ),
//                  ),
//   );

//   final planetCard = new Container(
//     height: 135.0,
//     width: 370,
//     margin: new EdgeInsets.only(left: 46.0),
//     decoration: new BoxDecoration(
//       color: Color(0xFF333366),
//       shape: BoxShape.rectangle,
//       borderRadius: new BorderRadius.circular(8.0),
//       boxShadow: <BoxShadow>[
//         new BoxShadow(  
//           color: Colors.black12,
//           blurRadius: 10.0,
//           offset: new Offset(0.0, 10.0),
//         ),
//       ],
//     ),
//     child:  Container(
//       margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
//       constraints: new BoxConstraints.expand(),
//       child: new Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           new Container(height: 4.0),
//           new Text('planet.name',
//             style: headerTextStyle,
//           ),
//           new Container(height: 10.0),
//           new Text('planet.location',
//             style: subHeaderTextStyle

//           ),
//           new Row(
//             children: <Widget>[
//              // new Image.asset("assets/img/ic_distance.png", height: 12.0),
//               new Container(width: 8.0),
//               new Text('planet.distance',
//                 style: regularTextStyle,
//               ),
//               new Container(width: 24.0),
//              // new Image.asset("assets/img/ic_gravity.png", height: 12.0),
//               new Container(width: 8.0),
//               new Text('planet.gravity',
//                 style: regularTextStyle,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );

//   final planetCardContent = new Container(
//       margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
//       constraints: new BoxConstraints.expand(),
//       child: new Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           new Container(height: 4.0),
//           new Text('planet.name',
//             style: headerTextStyle,
//           ),
//           new Container(height: 10.0),
//           new Text('planet.location',
//             style: subHeaderTextStyle

//           ),
//           new Row(
//             children: <Widget>[
//              // new Image.asset("assets/img/ic_distance.png", height: 12.0),
//               new Container(width: 8.0),
//               new Text('planet.distance',
//                 style: regularTextStyle,
//               ),
//               new Container(width: 24.0),
//              // new Image.asset("assets/img/ic_gravity.png", height: 12.0),
//               new Container(width: 8.0),
//               new Text('planet.gravity',
//                 style: regularTextStyle,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
    