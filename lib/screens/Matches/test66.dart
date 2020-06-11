// import 'package:flutter/material.dart';
// //import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import '../../models/Matches.dart';
// import '../../Services/Match.dart';
// import '../../models/User.dart';
// import 'package:provider/provider.dart';
// import '../../Services/User.dart';
// import 'Member_Item.dart';
// import 'test2.dart';

// class evaluteMemberList extends StatefulWidget{
//   final Match matchid;
//   evaluteMemberList({this.matchid});

//   @override
//   _evaluteMemberListState createState() => _evaluteMemberListState();
// }

// class _evaluteMemberListState extends State<evaluteMemberList> {
//   @override
//   Widget build(BuildContext context) {
//   //List<User> user = matchid.users;

    
//        final members = Provider.of<List<User>>(context) ?? [];
//           return ListView.builder( 
//             itemCount: members.length,
//             itemBuilder: (context, index) {
//               return test123(users:members[index]);});
//               }}