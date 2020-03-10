import 'package:flutter/material.dart';
import '../../Services/Fields.dart';

class fieldform extends  StatefulWidget {

  @override
  _fieldformState createState() => _fieldformState();
}

class _fieldformState extends State<fieldform> {
  final _formKey = GlobalKey<FormState>();

  String name , location,cap , start, finish, price;

  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
        title: Text('Add field'),
      ),
   body: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Name",
              border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              validator: (val) => val.isEmpty ? 'Enter Field Name' : null,
                onChanged: (val) {
                  setState(() => name = val); }
                ),
             
             
          SizedBox(height: 20.0,),
            TextFormField(
              decoration: InputDecoration(
                
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "cap",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.isEmpty ? 'Enter Field cap ' : null,
                onChanged: (val) {
                  setState(() => cap = val);}
            ),

            SizedBox(height: 20.0,),
              TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Location",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.isEmpty ? 'Enter Field Location ' : null,
                onChanged: (val) {
                  setState(() => location = val);}
            ),

            SizedBox(height: 20.0,),
              TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "start",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.isEmpty ? 'Enter Field start time ' : null,
                onChanged: (val) {
                  setState(() => start = val);}
            ),


            SizedBox(height: 20.0,),
             TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "finish",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.isEmpty ? 'Enter Field finish time ' : null,
                onChanged: (val) {
                  setState(() => finish = val);}
            ),




           SizedBox(height: 20.0,),
             TextFormField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Price",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             validator: (val) => val.isEmpty ? 'Enter Field Price ' : null,
                onChanged: (val) {
                  setState(() => price = val);}
            ),


             SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[300],
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    await FieldService().addFieldData(
                      name ,
                      cap ,
                      location ,
                      start ,
                      finish ,
                      price ,
                      true , 
                      true ,
                      false
                          );
                    Navigator.pop(context);
                  }
                }
              ),
              



        ],
        )
      ),
    )
    );
  }
}