import 'package:flutter/material.dart';

class CreateTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final teamName = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Your Team Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final members = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Members",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final area = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Area",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final createTeamButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffeceff1),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //Navigator.of(context).pushNamed('/homepage');
        },
        child: Text("Create Team",
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      body: Center(child: Container(
        color: Colors.indigoAccent,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 45.0),
              SizedBox(height: 45.0),
              teamName,
              SizedBox(height: 25.0),
              members,
              SizedBox(
                height: 15.0,
              ),
              area,
              SizedBox(
                height: 15.0,
              ),
              createTeamButton,
            ],
          ),
        ),
      ),
      ),
    );
  }
}