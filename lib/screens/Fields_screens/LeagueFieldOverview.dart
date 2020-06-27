// /*import 'package:flutter/material.dart';
// import 'package:flutter_app/models/field.dart';
// import './Fields_Iistview.dart';
// import 'package:provider/provider.dart';
// import '../../Providers/FieldsProvider.dart';
// import './Field_Details.dart';
// import '../../Providers/MatchesProvider.dart';
// import '../../models/User.dart';


// class FieldsOverview extends StatelessWidget
// {

//  /* final List<Match> matches=[
//     Match(ID: '1' ,Date: DateTime.now().toString(), Check_in: '19:00:00' ,Check_out: '20:00:00' ),
//     Match(ID: '2' ,Date: DateTime.now().toString(), Check_in: '20:00:00' ,Check_out: '21:00:00'),
//     Match(ID: '3' ,Date: DateTime.now().toString(), Check_in: '21:00:00' ,Check_out: '22:00:00'),
//     Match(ID: '4' ,Date: DateTime.now().toString(), Check_in: '22:00:00' ,Check_out: '23:00:00'),
//     Match(ID: '5' ,Date: DateTime.now().toString(), Check_in: '23:00:00' ,Check_out: '00:00:00'),
//   ];
//  */
//   @override
//   Widget build(BuildContext context) {
//    /* return  Scaffold(
//       appBar: AppBar(
//         title :Text('Fields')
//       ),
//       body:  ChangeNotifierProvider.value(
//         value:  Fields() ,
//           child:  Fieldview(),
//     ),
//     );
//          */


//         return MultiProvider(
//            providers: [
//          ChangeNotifierProvider.value(
//           value: Fields(),
//         ),
//       ],

//         child: MaterialApp(
//           // title: 'Fields',
//            home: Fieldview(),
//             //theme: ThemeData(
//             //primarySwatch: Colors.purple,
//             //accentColor: Colors.deepOrange,
//             //fontFamily: 'Lato',
//             //backgroundColor: Color(0) ,


//           //),
//            routes: {
//              FieldDetails.routeName: (ctx) => FieldDetails(),
//         },
//         )
//         );



// }
// }*/

// import 'package:flutter_app/screens/Fields_screens/FieldLeagueList.dart';

// import '../../models/field.dart';
// import '../../Services/Fields.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import './Fields_Iistview.dart';

// class FieldsLeagueOverview extends StatelessWidget {



//   @override
//   Widget build(BuildContext context) {


//     return StreamProvider<List<Field>>.value(
//       value: FieldService().fieldses,
//       child: Container(
//         /*  decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('images/5omasy.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),*/
//           child: FieldLeagueview()
//       ),
//     );
//   }
// }