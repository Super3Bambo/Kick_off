import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/models/Rating.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import '../../Shared/Loading.dart';


class mydata{
 String fName = '';
  String phone = '';
  String lName = '';
  String age = '';
  String position = '';
  String area = '';
    String photourl=null;
    



  
      
}
class completeRegister extends StatefulWidget {
         static const routeName = '/regcomplete';        
         

  @override
  _completeRegisterState createState() => _completeRegisterState();
}

class _completeRegisterState extends State<completeRegister> {

  final _formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //static var _focusNode = new FocusNode();
    static mydata data = new mydata();
   
  bool loading = false;
  // text field state
   final FirebaseMessaging _fcm = FirebaseMessaging();

  
  List<Field> date=[
    Field (Date: DateTime.now().toString())
  ];
  
  List<UserRating> rating=[
    UserRating(  Skills:0 , Morality: 0, Position_Skills: 0 )
  ];

  int currStep = 0;

  @override
  void initState() {
    super.initState();
    // _focusNode.addListener(() {
    //   setState(() {});
    //   print('Has focus: $_focusNode.hasFocus');
    // });
  }

  @override
  void dispose() {
   // _focusNode.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final List<String> positions = ['Center Forward', 'Midfielder', 'Center Back', 'GoalKeeper' , 'Select Your Position'];
    var uurl='https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg';
    List<Step> steps = [
    new Step(
      
        title: const Text('Personal Information'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.complete,
        content: Column( children: <Widget>[

           new TextFormField(
           // focusNode: _focusNode,
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              data.fName = value;
            },
            maxLines: 1,
            validator: (value) {
              if (value.isEmpty ) {
                return 'Please enter Frist Name';
              }
              else if(!RegExp(r'^[a-zA-Z]+$').hasMatch(value)){
                return 'Please enter Frist Name';
              }
              
            },
            decoration: new InputDecoration(
                labelText: 'Enter your Frist Name',
                hintText: 'Enter a Frist Name',
                //filled: true,
                icon: const Icon(Icons.person_outline),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ), new TextFormField(
           // focusNode: _focusNode,
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              data.lName = value;
            },
            maxLines: 1,
            validator: (value) {
              if (value.isEmpty ) {
                return 'Please enter Last Name';
              }
              else if(!RegExp(r'^[a-zA-Z]').hasMatch(value)){
                return 'Please enter Last Name';
              }
            },
            decoration: new InputDecoration(
                labelText: 'Enter your  Last Name',
                hintText: 'Enter a  Last Name',
                //filled: true,
                icon: const Icon(Icons.person),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ), new TextFormField(
            //focusNode: _focusNode,
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              data.age = value;
            },
            maxLines: 1,
            validator: (value) {
              if (value.isEmpty ) {
                return 'Please enter Age';
              }else if(!RegExp(r'^[0-9]').hasMatch(value) ||value.length>2){
                return 'Please enter valid Age';
              }
            },
            decoration: new InputDecoration(
                labelText: 'Enter your Age',
                hintText: 'Enter a Age',
                //filled: true,
                icon: const Icon(Icons.timeline),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),new TextFormField(
           // focusNode: _focusNode,
            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              data.phone = value;
            },
            maxLines: 1,
            validator: (value) {
              if (value.isEmpty ) {
                return 'Please enter Phone Number';
              }
              else if(!RegExp(r'^(?:[+0]9)?[0-9]').hasMatch(value) || value.length>11){
                return 'Please enter valid Phone Number';
              }
            },
            decoration: new InputDecoration(
                labelText: 'Enter your Phone Number',
                hintText: 'Enter a Phone Number',
                //filled: true,
                icon: const Icon(Icons.phone),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
        ],
                 
        ),
        ),
    new Step(
        title: const Text('Football Information'),
        //subtitle: const Text('Subtitle'),
        isActive: true,
        //state: StepState.editing,
        state: StepState.indexed,
        content: Column(children: <Widget>[
          new TextFormField(
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value.isEmpty ) {
                return 'Please enter your area';
              }
            },
            onSaved: (String value) {
              data.area = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                labelText: 'Enter your area',
                hintText: 'Enter a area',
                icon: const Icon(Icons.aspect_ratio),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),

          ), 
          // new TextFormField(
          //   keyboardType: TextInputType.text,
          //   autocorrect: false,
          //   validator: (value) {
          //     if (value.isEmpty ) {
          //       return 'Please enter your position';
          //     }
          //   },
          //   onSaved: (String value) {
          //     data.position = value;
          //   },
          //   maxLines: 1,
          //   decoration: new InputDecoration(
          //       labelText: 'Enter your position',
          //       hintText: 'Enter a position',
          //       icon: const Icon(Icons.phone),
          //       labelStyle:
          //           new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          // ),
          Container(
            margin: EdgeInsets.only(top:5),
            child: DropdownButtonFormField(
               validator: (value) {
                if (value.isEmpty|| value=='Select Your Position' ) {
                  return 'Please enter your Position';
                }
              },
             //  icon: ,
              value: 'Select Your Position',
              decoration: InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(10.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
),
         //   icon: Icon(Icons.track_changes),
         
              items: positions.map((pos) {
                return DropdownMenuItem(
                  value: pos,
                  child: Text('$pos'),
                );
              }).toList(), onChanged: (val) => setState(() => data.position = val ),
              
              ),
          ),
        ]
                   
        )
        ),
    new Step(
        title: const Text('Profile Picture'),
        // subtitle: const Text('Subtitle'),
         isActive: true,
        state: StepState.indexed,
        // state: StepState.disabled,
        // content: new TextFormField(
        //   keyboardType: TextInputType.text,
        //   autocorrect: false,
        //   validator: (value) {
        //     if (value.isEmpty) {
        //       return 'Please enter valid email';
        //     }
        //   },
        //   onSaved: (String value) {
        //     data.phone = value;
        //   },
        //   maxLines: 1,
        //   decoration: new InputDecoration(
        //       labelText: 'Enter your email',
        //       hintText: 'Enter a email address',
        //       icon: const Icon(Icons.email),
        //       labelStyle:
        //           new TextStyle(decorationStyle: TextDecorationStyle.solid)),
        // )
        content:  InkWell(
                   onTap: ()async{
                var image = await ImagePicker.pickImage(source: ImageSource.gallery);
              if( image!=null){
                var firebaseStorageRef = FirebaseStorage.instance.ref().child( image.path);
                var uploadTask = firebaseStorageRef.putFile( image);
                var photo = await (await uploadTask.onComplete ).ref.getDownloadURL();
                  
                  setState(() {
                    data.photourl= photo;
                  });
                   }},
               child:  CircleAvatar(
                    radius: 100,
                    child: ClipOval(
                   child: SizedBox(
                      width: 220.0,
                      height: 220.0,
                          
                  //backgroundImage: NetworkImage(imgUrl),
                //  child: (userData.Photo_url!=null)?Image.network(
                //           /* --------------------*/  userData.Photo_url,
                //             fit: BoxFit.fill,
                //           ):Image.network(
                //             imgUrl,
                //             fit: BoxFit.fill,
                //           ),
                child: (data.photourl!=null)? Image.network(  data.photourl ,fit: BoxFit.fill,):Image.network( uurl,fit: BoxFit.fill,),
                
                          
                 ),),),),
        ),
   
  ];
              final user = Provider.of<User>(context);

     _showSnackBar() {
    final snackBar = new SnackBar(
        content: new Text("Please enter correct data"),
        duration: new Duration(seconds: 3),
        action: new SnackBarAction(label: 'Back',
         onPressed: (){
           Navigator.pop(context);
        }),
    );
    //How to display Snackbar ?
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
     

  Future<void> _submitDetails() async {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        _showSnackBar();
      } else {
        formState.save();
       
            List<User> follow=[];
                         var tok=await _fcm.getToken();
         setState(() => loading = true);
           await UserService(userid: user.ID).addUserData(data.fName, data.lName, data.age, data.position, data.photourl.toString()??uurl,data.area, data.phone ,tok ,date ,follow,rating );
           await _fcm.subscribeToTopic('League');
           data.photourl=null;
      }
    }

 return new MaterialApp(
        theme: new ThemeData(
         // primarySwatch: Colors.blue[600],
        ),
        home: new Scaffold(
          key: _scaffoldKey,
          appBar: new AppBar(
            title: new Text('Complete Your Date'),
          ),
          body:new Container(
               child: Center(
                child: new Form(
        key: _formKey,
        child: new ListView(children: <Widget>[
            new Stepper(
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              onStepContinue: currStep==2? null: () {
                setState(() {
                  if (currStep < steps.length - 1) {
                    currStep = currStep + 1;
                  } else {
                    currStep = 0;
                  }
                  // else {
                  // Scaffold
                  //     .of(context)
                  //     .showSnackBar(new SnackBar(content: new Text('$currStep')));

                  // if (currStep == 1) {
                  //   print('First Step');
                  //   print('object' + FocusScope.of(context).toStringDeep());
                  // }

                  // }
                });
              },
              onStepCancel: currStep==2||currStep==0? null:() {
                setState(() {
                  if (currStep > 0) {
                    currStep = currStep - 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step) {
                setState(() {
                  currStep = step;
                });
              },
            ),
            SizedBox(height: 100,),
           RaisedButton(
               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)
                              ),
                              padding: const EdgeInsets.all(0.0),
                              textColor: Colors.white,
                               // color: Colors.blue[700],
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius:BorderRadius.circular(20) ,
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    Color(0xFF0D47A1),
                                                    Color(0xFF42A5F5),
                                                  ],
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10.0),                                  
                                    child: Text(
                                    '                              Save                              ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
              onPressed: _submitDetails,
              
              color: Colors.blue,
            ),
        ]),
      ),
          )),
    ));

    }
}
