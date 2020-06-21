import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/models/RatingField.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class editField extends StatefulWidget {
  Field field;
  
  editField({this.field});
  @override
  _editFieldState createState() => _editFieldState();
}
class _editFieldState extends State<editField> {
  final _formKey = GlobalKey<FormState>();
 String name,location,showstart,showend;
 var price;
    bool refree,
    ball,
    bathroom;
    DateTime start,end;
    String alert='';


  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("HH:00:00:000");

   
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.1;
     User user = Provider.of<User>(context);

return Scaffold(
  appBar: AppBar(title:Text('ffss')),
  body:   Container(
    margin: EdgeInsets.only(top:60),
    child: SingleChildScrollView(
          child: Form(
      
            key: _formKey,
      
            child:  Padding(
            padding: const EdgeInsets.all(10.0),
                        child: Column(
      
                children: <Widget>[
    
      
                  Container(
      
                    alignment: Alignment.topCenter,
      
                    child: Row(
      
                      crossAxisAlignment: CrossAxisAlignment.start,
      
                      children: <Widget>[
      
                        Container(
      
                          alignment: Alignment.topCenter,
      
                          width: halfMediaWidth,
      
                          child: MyTextFormField(
                            initvalue: widget.field.Name,
      
                            hintText: 'Name',
      
                            validator: (String value) {
      
                              if (value.isEmpty) {
      
                                return 'Enter your first name';
      
                              }
      
                              return null;
      
                            },
      
                            onSaved: (String value) {
      
                             setState(() =>name=value );
      
                            },
      
                          ),
      
                        ),
      
                        Container(
      
                          alignment: Alignment.topCenter,
      
                          width: halfMediaWidth,
      
                          child: MyTextFormField(
                            initvalue: widget.field.Location,
      
                            hintText: 'Location',
      
                            validator: (String value) {
      
                              if (value.isEmpty) {
      
                                return 'Enter your last name';
      
                              }
      
                              return null;
      
                            },
      
                            onSaved: (String value) {
      
                             setState(() =>location=value );
      
                            },
      
                          ),
      
                        )
      
                      ],
      
                    ),
      
                  ),


                    Container(
               margin: EdgeInsets.only(top:20),
                      child: Column(
                        children: <Widget>[
                          Slider(
                            label: 'Price',
                            value: widget.field.Price.toDouble(),
                            inactiveColor: Colors.blueAccent,
                      activeColor: Colors.blue,
                            min: 50.0,
                            max: 150.0,
                            divisions: 10,
                           onChanged: (val) => setState(() => price=val.round()),
                          ),
                        ],
                      ),
                    ),
                     



                      price!=null? Text(price.toString()+' '+'\$'):Text('0' +' '+'\$'),
                  // MyTextFormField(
                  //   initvalue: widget.field.Price.toString(),
      
                  //   hintText: 'Price',
      
                  //   //isEmail: true,
      
                  //   validator: (String value) {
      
                  //     if (value.isEmpty) {
      
                  //       return 'Please enter a valid email';
      
                  //     }
      
                  //     return null;
      
                  //   },
      
                  //   onSaved: (String value) {
      
                  //    setState(() =>price=value );
      
                  //   },
      
                  // ),
              Container(
                margin: EdgeInsets.only(top:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // [Monday] checkbox
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Refree"),
                      Checkbox(
                        value:refree?? widget.field.Refree,
                        onChanged: (bool values) {
                          setState(() {
                            refree = values;
                          });
                        },
                      ),
                    ],
                  ),
                  // [Tuesday] checkbox
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Ball"),
                      Checkbox(
                        value:  ball?? widget.field.Ball,
                        onChanged: (bool values) {
                          setState(() {
                            ball = values;
                          });
                        },
                      ),
                    ],
                  ),
                  // [Wednesday] checkbox
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Bathroom"),
                      Checkbox(
                        value:bathroom?? widget.field.Bathroom,
                        onChanged: (bool values) {
                          setState(() {
                            bathroom = values;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 300.0,
                            ),
                            showTitleActions: true,
                          
                             onConfirm: (time) {
                        showstart = dateFormat.format(time);
                          setState(() =>start=time );
                        }, 
                        currentTime: DateTime.now(), locale: LocaleType.en);
                       // setState(() =>start=date );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        " ${showstart??widget.field.Start_at}",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                          "  Change",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 300.0,
                            ),
                            showTitleActions: true, onConfirm: (time) {
                         // print('confirm $time');
                         showend = dateFormat.format(time);
                          setState(() =>end=time );
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Colors.blue,
                                      ),
                                      
                                      Text( " ${showend??widget.field.Finish_at}",
                                       // " $_time",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                           Text(
                          "  Change",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
          ),

        
                  RaisedButton(
      
                    color: Colors.blueAccent,
      
                    onPressed: ()async {
      
                      if (_formKey.currentState.validate()) {
                       
                          alert='';
                          
                         _formKey.currentState.save();
                         var st,se;
                        start==null? st=null:  st= dateFormat.format(start);
                       end==null? se=null :st=dateFormat.format(end);
                        
                        print(ball);
                        print(bathroom);
                        print(refree);
                        await FieldService(fieldid: widget.field.ID).editFieldData(name?? widget.field.Name, location?? widget.field.Location, price?? widget.field.Price, 
                        refree==null? widget.field.Refree:refree , ball?? widget.field.Ball, bathroom?? widget.field.Bathroom, widget.field.start_time
                        ,widget.field.finish_time , widget.field.duration ,widget.field.rate , st?? widget.field.Start_at ,se?? widget.field.Finish_at ,widget.field.Owner);
                        Navigator.pop(context);
                       // _formKey.currentState.reset();

                        
                       
      
                      }
      
                    },
      
                    child: Text(
      
                      'Edit',
      
                      style: TextStyle(
      
                        color: Colors.white,
      
                      ),
      
                    ),
      
                  ),
                  Container(
                    height: 30,
                    child: Text(alert ,style:TextStyle(color: Colors.red)),
                  ),
      
                ],
      
              ),
            ),
      
          ),
    ),
  ),
);
  }
}
class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final String initvalue;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
    this.initvalue
  });
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initvalue,
        
        autofocus: false,
        decoration: InputDecoration(
          //icon: Icon(Icons.chat),
          focusColor: Colors.blue,
          hintText: hintText,
          
          contentPadding: EdgeInsets.all(15.0),
         // border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}