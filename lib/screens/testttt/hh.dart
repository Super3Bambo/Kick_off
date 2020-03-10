import '../../models/field.dart';
import '../testttt/showfielddata.dart';
import '../../Services/Fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class sss extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<Field>>.value(
      value: FieldService().fieldses,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fields'),
         
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5omasy.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BrewList()
        ),
      ),
    );
  }
}