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
import 'package:rflutter_alert/rflutter_alert.dart';
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
    var uurl='https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg';
    List<Step> steps = [
    new Step(
        title: const Text('Personal Information'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
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
            autocorrect: false,
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

          ), new TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            validator: (value) {
              if (value.isEmpty ) {
                return 'Please enter your position';
              }
            },
            onSaved: (String value) {
              data.position = value;
            },
            maxLines: 1,
            decoration: new InputDecoration(
                labelText: 'Enter your position',
                hintText: 'Enter a position',
                icon: const Icon(Icons.phone),
                labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
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
        //backgroundColor: Colors.pink[300],
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
        // print("Name: ${data.fName}");
        // print("Phone: ${data.phone}");
        // print("Email: ${data.area}");
        // print("Age: ${data.age}");

        // showDialog(
        //     context: context,
        //     child: new AlertDialog(
        //       title: new Text("Details"),
        //       //content: new Text("Hello World"),
        //       content: new SingleChildScrollView(
        //         child: new ListBody(
        //           children: <Widget>[
        //             new Text("Name : " + data.fName),
        //             new Text("Phone : " + data.phone),
        //             new Text("Email : " + data.area),
        //             new Text("Age : " + data.age),
        //           ],
        //         ),
        //       ),
        //       actions: <Widget>[
        //         new FlatButton(
        //           child: new Text('OK'),
        //           onPressed: () {
        //             //Navigator.of(context).pop();
        //           },
        //         ),
        //       ],
        //     ));
       
            List<User> follow=[];
                         var tok=await _fcm.getToken();
         setState(() => loading = true);
           await UserService(userid: user.ID).addUserData(data.fName, data.lName, data.age, data.position, data.photourl.toString()??uurl,data.area, data.phone ,tok ,date ,follow,rating );
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
            title: new Text('Complete Date'),
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
              onStepContinue: () {
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
              onStepCancel: () {
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
            new RaisedButton(
              
              child: new Text(
                'Save details',
                style: new TextStyle(color: Colors.white),
              ),
              onPressed: _submitDetails,
              // () async{
              //   List<User> follow=[
              //               User(ID: user.ID)
              //                 ];
              //            var tok=await _fcm.getToken();
                           
                       
              //           if(_formKey.currentState.validate()){
              //               setState(() => loading = true);
              //           await UserService(userid: user.ID).addUserData(data.fName, data.lName, data.age, data.position, data.photourl,data.area, data.phone ,tok ,date ,follow,rating );  
              //             }else{_formKey.currentState.save();}

                                            
              //           },
              
              color: Colors.blue,
            ),
        ]),
      ),
          )),
    ));
 

    /*  return  loading? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
        title: Text('Compelete Your Information'),
      ),
   body:  Container(
        child: SingleChildScrollView(
       
        padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
        child: Form(
          key: _formKey,
           
          child: Column(children: <Widget>[


            SizedBox(height: 15.0,),
              TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Frist Name",
                border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                //validator: (val) => val.isEmpty ? 'Enter Your Frist Name' : null,
                  onChanged: (val) {
                    setState(() => fName = val); }
                  ),
               
               
            SizedBox(height: 15.0,),
              TextFormField(
                decoration: InputDecoration(
                  
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Last Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

              // validator: (val) => val.length == 8 ? 'Enter Your Last Name ' : null,
                  onChanged: (val) {
                    setState(() => lName = val);}
              ),

              SizedBox(height: 15.0,),
                TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Age",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

               //validator: (val) => val.length == 8 ? 'Enter Your Age ' : null,
                  onChanged: (val) {
                    setState(() => age = val);}
              ),

              SizedBox(height: 15.0,),
                TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "area",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

               //validator: (val) => val.length == 8 ? 'Enter Your area ' : null,
                  onChanged: (val) {
                    setState(() => area = val);}
              ),


              SizedBox(height: 15.0,),
               TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "position",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

              // validator: (val) => val.length == 8 ? 'Enter Your position ' : null,
                  onChanged: (val) {
                    setState(() => position = val);}
              ),




             SizedBox(height: 15.0,),
               TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Phone",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))), 

             //  validator: (val) => val.length == 8 ? 'Enter Your Phone ' : null,
                  onChanged: (val) {
                    setState(() => phone = val);}
              ),


               SizedBox(height: 15.0),
                RaisedButton(
                  color: Colors.pink[300],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    List<User> follow=[
                        User(ID: user.ID)
                          ];
                    FirebaseUser useres = await FirebaseAuth.instance.currentUser();
                   var token = useres.getIdToken();
                  String tok= token.then((value) => value.token).toString();
                       
                   
                    if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                    await UserService(userid: user.ID).addUserData(fName, lName, age, position, area, phone ,'h',tok ,date ,follow,rating  );  
                      }
                         loading=false;

                                        
                    }
                  
                ),
                



          ],)
        ),
      ),
   ));*/
    }
}
