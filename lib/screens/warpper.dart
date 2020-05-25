import '../models/User.dart';
import './authenticate/authenticate.dart';
import './Home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home/Choise.dart';
import './authenticate/Log_Reg_Page.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    
    final user = Provider.of<User>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return AuthPage();
    } else {
      return Choise();
    }
    
  }
}