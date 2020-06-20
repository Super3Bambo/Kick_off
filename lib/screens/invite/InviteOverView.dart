import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Invations.dart';
import 'package:flutter_app/models/Invite.dart';
import 'package:flutter_app/models/User.dart';
import 'package:provider/provider.dart';

import 'InviteList.dart';


class inviteOverview extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
 User user = Provider.of<User>(context);


return StreamProvider<List<Invite>>.value(

      value: InviteService(userid: user.ID).userinvite,

     
        child: Container(
       
          child:InviteList() ,
        ),
      
    );
  }
  }