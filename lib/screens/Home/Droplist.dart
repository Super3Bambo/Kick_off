// import 'package:flutter/material.dart';

// class DropList extends StatefulWidget {
//   DropList() : super();

//   final String title = "DropDown Demo";

//   @override
//   DropListState createState() => DropListState();
// }

// class Company {
//   int id;
//   String name;

//   Company(this.id, this.name);

//   static List<Company> getCompanies() {
//     return <Company>[
//       Company(1, '00 AM'),
//       Company(2, '01 AM'),
//       Company(3, '02 AM'),
//       Company(4, '03 AM'),
//       Company(5, '04 AM'),
//       Company(6, '05 AM'),
//       Company(7, '06 AM'),
//       Company(8, '07 AM'),
//       Company(9, '08 AM'),
//       Company(10, '09 AM'),
//       Company(11, '10 AM'),
//       Company(12, '11 AM'),
//       Company(13, '12 PM'),
//       Company(14, '01 PM'),
//       Company(15, '02 PM'),
//       Company(16, '03 PM'),
//       Company(17, '04 PM'),
//       Company(18, '05 PM'),
//       Company(19, '06 PM'),
//       Company(20, '07 PM'),
//       Company(21, '08 PM'),
//       Company(22, '09 PM'),
//       Company(23, '10 PM'),
//       Company(24, '11 PM'),
//     ];
//   }
// }
// class Company2 {
//   int id;
//   String name;

//   Company2(this.id, this.name);

//   static List<Company2> getCompanies2() {
//     return <Company2>[
//       Company2(1, '00 AM'),
//       Company2(2, '01 AM'),
//       Company2(3, '02 AM'),
//       Company2(4, '03 AM'),
//       Company2(5, '04 AM'),
//       Company2(6, '05 AM'),
//       Company2(7, '06 AM'),
//       Company2(8, '07 AM'),
//       Company2(9, '08 AM'),
//       Company2(10, '09 AM'),
//       Company2(11, '10 AM'),
//       Company2(12, '11 AM'),
//       Company2(13, '12 PM'),
//       Company2(14, '01 PM'),
//       Company2(15, '02 PM'),
//       Company2(16, '03 PM'),
//       Company2(17, '04 PM'),
//       Company2(18, '05 PM'),
//       Company2(19, '06 PM'),
//       Company2(20, '07 PM'),
//       Company2(21, '08 PM'),
//       Company2(22, '09 PM'),
//       Company2(23, '10 PM'),
//       Company2(24, '11 PM'),
//     ];
//   }
// }

// class DropListState extends State<DropList> {
//   //
//   List<Company> _companies = Company.getCompanies();
//   List<DropdownMenuItem<Company>> _dropdownMenuItems;
//   Company _selectedCompany;

//   List<Company2> _companies2 = Company2.getCompanies2();
//   List<DropdownMenuItem<Company2>> _dropdownMenuItems2;
//   Company2 _selectedCompany2;


//   @override
//   void initState() {
//     _dropdownMenuItems = buildDropdownMenuItems(_companies);
//     _selectedCompany = _dropdownMenuItems[0].value;
//     super.initState();

//     _dropdownMenuItems2 = buildDropdownMenuItems2(_companies2);
//     _selectedCompany2 = _dropdownMenuItems2[0].value;
//     super.initState();


//   }





//   List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
//     List<DropdownMenuItem<Company>> items = List();
//     for (Company company in companies) {
//       items.add(
//         DropdownMenuItem(
//           value: company,
//           child: Text(company.name),
//         ),
//       );
//     }
//     return items;
//   }


//   List<DropdownMenuItem<Company2>> buildDropdownMenuItems2(List companies2) {
//     List<DropdownMenuItem<Company2>> items = List();
//     for (Company2 company2 in companies2) {
//       items.add(
//         DropdownMenuItem(
//           value: company2,
//           child: Text(company2.name),
//         ),
//       );
//     }
//     return items;
//   }

//   onChangeDropdownItem(Company selectedCompany) {
//     setState(() {
//       _selectedCompany = selectedCompany;
//     });
//   }

//   onChangeDropdownItem2(Company2 selectedCompany2) {
//     setState(() {
//       _selectedCompany2 = selectedCompany2;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text("E7gzly"),
//         ),
//         body: new Container(
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text("From"),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 DropdownButton(
//                   value: _selectedCompany,
//                   items: _dropdownMenuItems,
//                   onChanged: onChangeDropdownItem,
//                 ),
//                 Text("To"),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 DropdownButton(
//                   value: _selectedCompany2,
//                   items: _dropdownMenuItems2,
//                   onChanged: onChangeDropdownItem2,
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Text('Selected: ${_selectedCompany.name} -${_selectedCompany2.name} '),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }