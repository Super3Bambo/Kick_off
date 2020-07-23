import 'package:flutter_app/Services/Auth.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Home/Test.dart';
import 'package:flutter_app/screens/OwnerDashBoard/dashboard.dart';
import 'package:flutter_app/screens/authenticate/authenticate.dart';
import 'package:flutter_app/screens/authenticate/OnBorder.dart';
import 'package:flutter_app/screens/authenticate/Rgester_Complete.dart';
import 'package:provider/provider.dart';
import 'Testtows.dart';
import 'homepage.dart';
import '../authenticate/Log_Reg_Page.dart';




class Choise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    
    final user = Provider.of<User>(context);
    
    // return either the Home or Authenticate widget
    if (user != null){
      return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userData = snapshot.data;
          if(userData.Role=='User'){
            return HomePage(0,null);
          }
          else if(userData.Role=='Owner'){
            return Dashboard();
          }
          else{return Testtts();}
          
          
          }else{ 
            
             return Example();}
             
             });
    
  }else {return AuthPage();}
}}