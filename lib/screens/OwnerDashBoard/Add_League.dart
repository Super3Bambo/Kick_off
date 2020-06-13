import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/League.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
class FormScreen extends StatefulWidget {

  final Field fieldid;

  FormScreen({this.fieldid});


  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  DateTime _start;
  DateTime _finish;
  String _desc;
  String _prize;
  String _name;
  List<Team> _teams;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");

    return  Scaffold (
        key: _scaffoldKey,
        appBar: AppBar(
        title: Text('Add a new league!'),
    ),

    body: Container(
    child: Center(
    child: SingleChildScrollView(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    new Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[


    ],),

    SizedBox(
    height: 20.0,
    ),

/*<<<<<<< HEAD:lib/screens/OwnerDashBoard/Add_League.dart
    return null;
    },
    onSaved: (String value) {
    _fieldid = value;
    },
    ),
      SizedBox(
    height: 20.0,
    ),
=======
>>>>>>> f3ebf57f4ade9dbc7f6681099e937488ca20c7c9:lib/screens/League/Add_League.dart*/
    DateTimePickerFormField(
    inputType: InputType.both,
    format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
    editable: false,
    decoration: InputDecoration(
    labelText: 'Start', hasFloatingPlaceholder: false),
    onChanged: (dt) {
    setState(() => _start = dt );
    },
    ),

    SizedBox(
    height: 20.0,
    ),

    DateTimePickerFormField(
    inputType: InputType.both,
    format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
    editable: false,
    decoration: InputDecoration(
    labelText: 'Finish', hasFloatingPlaceholder: false),
    onChanged: (dt) {
    setState(() => _finish = dt);
    },
    ),
    SizedBox(
    height: 20.0,
    ),

    TextFormField(
    decoration: InputDecoration(labelText: 'Describtion'),
    validator: (String value) {
    if (value.isEmpty) {
    return 'Describtion is Required';
    }

    return null;
    },

      onChanged: (dt) {
        setState(() => _desc = dt);
      },
    ),

    SizedBox(
    height: 20.0,
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Prize'),
    validator: (String value) {
    if (value.isEmpty) {
    return 'Prize is Required';
    }

    return null;
    },

      onChanged: (dt) {
        setState(() => _prize = dt);
      },
    ),
    SizedBox(
    height: 20.0,
    ),
    TextFormField(
    decoration: InputDecoration(labelText: 'Name'),
    validator: (String value) {
    if (value.isEmpty) {
    return 'Name is Required';
    }


    return null;
    },

      onChanged: (dt) {
        setState(() => _name = dt);
      },
    ),
    SizedBox(
    height: 20.0,
    ),


    RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () async {
                  var s=dateFormat.format(_start);
                  var f= dateFormat.format(_finish);
                  await LeagueService().addleague(
                      widget.fieldid.ID,s,f,_teams,_prize,_name,_desc
                  );
                  Navigator.pop(context);



                  print(_name);
                  print(_start);
                  print(_finish);
                  print(_desc);
                  print(_prize);
                  print(_teams);


                  //Send to API
                },
              )
            ],

          ),
        ),
      ),
    ),);
  }
}


  /*Widget _buildID() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'ID'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'ID is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _fieldid = value;
      },
    );
  }

  Widget _buildStart() {
    DateTimePickerFormField(
      inputType: InputType.both,
      format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
      editable: false,
      decoration: InputDecoration(
          labelText: 'Finish', hasFloatingPlaceholder: false),
      onChanged: (dt) {
        setState(() => _start = dt );
      },
    );
  }

  Widget _buildFinish() {
    DateTimePickerFormField(
      inputType: InputType.both,
      format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
      editable: false,
      decoration: InputDecoration(
          labelText: 'Finish', hasFloatingPlaceholder: false),
    onChanged: (dt) {
    setState(() => _finish = dt);
    },
    );
  }

  Widget _buildDESC() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Describtion'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Describtion is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _desc = value;
      },
    );
  }

  Widget _buildPrize() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Prize'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Prize is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _prize = value;
      },
    );
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }


        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }
Widget _buildTeam1(){
  return TextFormField(
    decoration: InputDecoration(labelText: 'Team number 1'),
    validator: (String value) {
      if (value.isEmpty) {
        return 'Name is Required';
      }


      return null;
    },
    onSaved: (String value) {
      _teams = value as List<Team>;
    },
  );
}
  Widget _buildTeam2(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Team number 2'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }


        return null;
      },
      onSaved: (String value) {
        _teams = value as List<Team>;
      },
    );
  }
  Widget _buildTeam3(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Team number 3'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }


        return null;
      },
      onSaved: (String value) {
        _teams = value as List<Team>;
      },
    );
  }
  Widget _buildTeam4(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Team number 4'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }


        return null;
      },
      onSaved: (String value) {
        _teams = value as List<Team>;
      },
    );
  }
  Widget _buildTeam5(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Team number 5'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }


        return null;
      },
      onSaved: (String value) {
        _teams = value as List<Team>;
      },
    );
  }*/
