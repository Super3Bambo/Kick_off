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


class addField extends StatefulWidget {
  @override
  _addFieldState createState() => _addFieldState();
}
class _addFieldState extends State<addField> {
  final _formKey = GlobalKey<FormState>();
@override
// _getImageList() async {
//     var resultList = await MultiImagePicker.pickImages(
//       maxImages :  10 ,
//       enableCamera: true,
//     );
    
//     // The data selected here comes back in the list
//     print(resultList);
//     for ( var imageFile in resultList) {
//          postImage(imageFile).then((downloadUrl) {
//             // Get the download URL
//             print(downloadUrl.toString());
//          }).catchError((err) {
//            print(err);
//          });
//     }
// }
// Future<dynamic> postImage(Asset imageFile) async {
//     await imageFile.getByteData();
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
//     StorageUploadTask uploadTask = reference.putData(imageFile.imageData.buffer.asUint8List());
//     StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
//     return storageTaskSnapshot.ref.getDownloadURL();
//   }

 String name='',location='',showstart='',showend='';
 int price;
    bool refree=false,
    ball=false,
    bathroom=false;
    DateTime start,end;
    String alert='';
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
      
                  // MyTextFormField(
      
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
                   Slider(
                   //   label: 'Price',
                      value: 50.5,
                     // inactiveColor: Colors.blueAccent,
                     // activeColor: Colors.blue,
                      min: 50.0,
                      max: 150.0,
                      divisions: 10,
                     onChanged: (val) => setState(() => price=val.round()),
                    ),
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
                        value: refree,
                        onChanged: (bool value) {
                          setState(() {
                            refree = value;
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
                        value: ball,
                        onChanged: (bool value) {
                          setState(() {
                            ball = value;
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
                        value: bathroom,
                        onChanged: (bool value) {
                          setState(() {
                            bathroom = value;
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
                                        " $showstart",
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
                                      Text( " $showend",
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
                        if(start==null){
                          setState(() {
                            alert='Please Enter Start Time';
                          });
                        }else if(end==null) {
                          setState(() {
                            alert='Please Enter End Time';
                          });
                        }
                        else{
                          alert='';
                          List<Field> time=[
                            Field(Start_at: DateTime.now().toString())
                          ];
                          List<FieldRating> rating=[
                            FieldRating( Rate:0)
                          ];
                         _formKey.currentState.save();
                        var st= dateFormat.format(start);
                        var se =dateFormat.format(end);
                        //var price2=int.parse(price);
                        await FieldService().addFieldData(name, location, price, refree, ball, bathroom, time, rating , st ,se ,user.ID);
                        Navigator.pop(context);
                       // _formKey.currentState.reset();

                        }
                       
      
                      }
      
                    },
      
                    child: Text(
      
                      'Add',
      
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
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        
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