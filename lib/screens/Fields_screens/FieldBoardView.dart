// /*import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../Providers/FieldsProvider.dart';
// import './Field_Item.dart';



// class Fieldview extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

// final fieldsData = Provider.of<Fields>(context);
//     final fields = fieldsData.fields;
// return Scaffold(
//   appBar: AppBar(
//     title: Text('Fields'),
//   ),
// body: ListView.builder(
//       padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
//           itemCount:fields.length ,
//           itemBuilder: (context, index) => ChangeNotifierProvider.value(
//             value: fields[index],
//           // builder: (c)=> fields[index],
//             child: FieldItem(),
//           ),),
//           );
//   }
//   }*/

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../models/field.dart';
// import 'Field_Item.dart';
// class FieldBoardView extends StatefulWidget {
//   @override
//   _FieldBoardViewState createState() => _FieldBoardViewState();
// }

// class _FieldBoardViewState extends State<FieldBoardView> {
//   @override
//   Widget build(BuildContext context) {

//     final field = Provider.of<List<Field>>(context) ?? [];

//     return ListView.builder(
//       itemCount: field.length,
//       itemBuilder: (context, index) {
//         return FieldItem(fields: field[index]);
//       },
//     );
//   }
// }