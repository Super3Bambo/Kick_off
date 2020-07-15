// import 'package:flutter/material.dart';
// import 'package:flutter_app/Shared/Loading.dart';
// import 'package:flutter_app/models/team.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:provider/provider.dart';
// import './teamMembers.dart';
// import './teamBoard.dart';
// import 'package:intl/intl.dart';

// class test extends StatelessWidget {
//   final Team team;

//   test({this.team});

//   @override
//   Widget build(BuildContext context) {

// godetails(Team id){
// Navigator.push(context,MaterialPageRoute(builder: (context)=> TeamBoard(team: team)  ) );}
//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: Card(
        
//         margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
//         child: ListTile(
//          onTap: () => godetails(team), 
          
//           leading: CircleAvatar(
//             radius: 25.0,
//             backgroundImage: AssetImage('images/5omasy.jpg'),
//           ),
//          title: Text(team.Name),
//        //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
//          subtitle: Text(team.NO_team),
//       ),
//     )
//     );}}