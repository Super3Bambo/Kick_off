// import 'package:flutter/material.dart';
// import 'package:flutter_app/models/User.dart';
// import 'package:rating_bar/rating_bar.dart';


// class test123 extends StatelessWidget {
//   final User users;
//   test123({ this.users });

//   Widget build(BuildContext context) {

//    return Container(
      
//       height: 120.0,
//       margin: const EdgeInsets.symmetric(
//         vertical: 16.0,
//         horizontal: 24.0,
//       ),
//       child: InkWell(
//         //onTap: (){godetails(following);},
//               child: new Stack(
//           children: <Widget>[
//             Container(
//     height: 135.0,
//     width: 370,
//     margin: new EdgeInsets.only(left: 46.0),
//     decoration: new BoxDecoration(
//         color: Color(0xFF333366),
//         shape: BoxShape.rectangle,
//         borderRadius: new BorderRadius.circular(8.0),
//         boxShadow: <BoxShadow>[
//           new BoxShadow(  
//             color: Colors.black12,
//             blurRadius: 10.0,
//             offset: new Offset(0.0, 10.0),
//           ),
//         ],
//     ),
//     child:  Container(
//         margin: new EdgeInsets.fromLTRB(76.0, 11.0, 16.0, 11.0),
//         constraints: new BoxConstraints.expand(),
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             new Text('.LName',
//               style: headerTextStyle,
//             ),
//             RatingBar.readOnly(
//                       initialRating: 2.0,
//                       isHalfAllowed: true,
//                       halfFilledIcon: Icons.star_half,
//                       filledIcon: Icons.star,
//                       emptyIcon: Icons.star_border,
//                       filledColor:Color.fromRGBO(243, 93, 68, 100),
//                       emptyColor: Color.fromRGBO(243, 93, 66, 100),
//                       halfFilledColor: Color.fromRGBO(243, 93, 68, 100), 
//                     ),
//                    // new Container(height: 6.0),
//             new Row(
//               children: <Widget>[
//                Icon( 
//                       Icons.assignment,
//                        size: 16.0,
//                       color:  Color(0xffb6b2df),        
//                    ),              
//                 new Container(width: 8.0),
//                 new Text('22',
//                   style: regularTextStyle,
//                 ),
//                 new Container(width: 24.0),
//                         Icon( 
//                       Icons.assignment,
//                        size: 16.0,
//                       color:  Color(0xffb6b2df),
                                        
//                    ),              
//                   new Container(width: 8.0),
//                 new Text('22',
//                   style: regularTextStyle,
//                 ),
//               ],
//             ),
//           ],
//         ),
//     ),
//   ),
//             Container(
//     margin: new EdgeInsets.only(
//         top: 16.0,
//         bottom: 16.0,

//     ),
//     alignment: FractionalOffset.centerLeft,
    
//     child:  CircleAvatar(
//                      backgroundColor:  Colors.blueGrey,
//                       radius: 50,
//                       child: ClipOval(
                        
//                      child: SizedBox(
//                           width: 85.0,
//                           height: 85.0,
//                             child: Image.asset('images/5omasy.jpg' , fit: BoxFit.fill, ),
//                     //backgroundImage: NetworkImage(imgUrl),
                            
                   
//                    ),
//                    ),
//                    ),
//   ),
//           ],
//         ),
//       )
//     );
//   }
  
  
//   }
//   final baseTextStyle = const TextStyle(
//       fontFamily: 'Poppins'
//     );
//     final headerTextStyle = baseTextStyle.copyWith(
//      // color: const Colors.white,
//      color:  Colors.white,
//       fontSize: 18.0,
//       fontWeight: FontWeight.w600
//     );
//      final regularTextStyle = baseTextStyle.copyWith(
//       color: const Color(0xffb6b2df),
//       fontSize: 17.0,
//       fontWeight: FontWeight.bold
//     );