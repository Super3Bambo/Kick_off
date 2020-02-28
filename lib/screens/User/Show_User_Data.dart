import '../../models/User.dart';
import '../../Services/User.dart';
import '../../Shared/Loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Show_User_Data extends StatefulWidget {
  @override
  _Show_User_DataState createState() => _Show_User_DataState();
}

class _Show_User_DataState extends State<Show_User_Data> {


  // form values
  String _currentName;
  String _currentAge;
  int _currentPosition;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          User userData = snapshot.data;
            return MaterialApp(
              home: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.FName,
                  decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),),
                ),


                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.Age,
                  decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),),
                ),


                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.Position,
                  decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),),
                ),



              ],
              ),);
              
              }else{
                  return Loading();

              }
              }
              );
              }
              }