import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';

import 'TeamMemberItemcontent.dart';

class TeamMemberItemshape extends StatelessWidget {
final User members;
  TeamMemberItemshape({ this.members });

  @override
  Widget build(BuildContext context) {
    return new TeamMemberItemcontent (members: members,); 
        
      
    
  }
}