import 'package:flutter/material.dart';
import '../../Shared/Loading.dart';
import '../../Services/Team.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';

class CreateTeam extends StatefulWidget {
  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {

  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String nO_Team ;
  String name ;
  

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
return  loading? Loading() : Scaffold( appBar: AppBar( title:Text("Create Your Team")),

body:  Container(
        child: SingleChildScrollView(
           padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
        child: Form(
          key: _formKey,
           
          child: Column(children: <Widget>[
             SizedBox(height: 17.0,),
              TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Name",
                border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                validator: (val) => val.isEmpty ? 'Enter Your Team Name' : null,
                  onChanged: (val) {
                    setState(() => name = val); }
                  ),

            SizedBox(height: 17.0,),
              TextFormField(
                decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Team counter",
                border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                validator: (val) => val.isEmpty ? 'Enter Number Of Team' : null,
                  onChanged: (val) {
                    setState(() => nO_Team = val); }
                  ),


                   SizedBox(height: 15.0),
                RaisedButton(
                  color: Colors.pink[300],
                  child: Text(
                    'Create Team',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        await TeamService().createTeam(name, nO_Team, users);
                     loading = false;
                     Navigator.pop(context);

                        }
                      }
                    
                  
                ),
          ]
        )
        )


)
)
);
    /*final teamName = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Your Team Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
          ),
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
    );*/
  }
}