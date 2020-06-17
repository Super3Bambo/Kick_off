import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Fields_screens/Fields_Overview.dart';
import 'package:flutter_app/screens/OwnerDashBoard/Field/Fields_Overview.dart';

import 'AddFieldForm.dart';
//import 'Field/AddFieldForm.dart';

class fieldView extends    StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize( preferredSize: Size.square(70),
       child:AppBar(
         
        title:Container(
           margin: EdgeInsets.only(top:8) 
           ,child: Text('Fields'),),
        automaticallyImplyLeading: true,
        centerTitle: true,
        leading: Container(margin: EdgeInsets.only(top:8), child:BackButton(color:Colors.white),),
         actions: <Widget>[
           Container(
             margin: EdgeInsets.only(top:8, right: 15) ,
          child: IconButton(
            icon: Icon(Icons.add_to_photos),
           // label: Text(''),
            onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) =>addField(),) )
          ),)
        ],),    
        
      ),
      body: FieldsOverviewowner(),
      
    );
  }
}