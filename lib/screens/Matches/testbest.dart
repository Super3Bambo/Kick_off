// import '../../models/Matches.dart';
// import '../../Services/Match.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import './Matches_listview_User.dart';
// import '../../models/User.dart';
// import '../../Services/User.dart';
// import 'Member_ListView.dart';
// import 'test2.dart';
// import 'test66.dart';

// class evalutemember extends StatelessWidget {

//   final Match matchid;
//   evalutemember({this.matchid});
  

//   @override
//   Widget build(BuildContext context) {
// final members = Provider.of<List<User>>(context) ?? [];
//     return StreamProvider<List<User>>.value(
//       value: UserService(user: matchid.users.map((f)=>f.ID).toList()).members,
      

     
//         child: Container(
//        /*   decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('images/5omasy.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),*/
          
//           child:  ListView.builder( 
//             itemCount: members.length,
//             itemBuilder: (context, index) {
//               return test123(users:members[index]);}),
//         ),
//       );
    
//   }
// }