import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/team.dart';
import '../../models/field.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class FieldDetails extends StatefulWidget {
  
  
  final Field fieldid;
final Team teamid;
  FieldDetails({this.fieldid,this.teamid});

  @override
  _FieldDetailsState createState() => _FieldDetailsState();
}

class _FieldDetailsState extends State<FieldDetails> {
  DateTime start, finish = DateTime.now();
  int diff,diff2;
  DateTime now=DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.fieldid.ID),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new ClipRRect(
                
                child: Image(
                  image: AssetImage('images/5omasy.jpg'),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: new Radius.circular(16.0),
                  topRight: new Radius.circular(16.0),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      widget.fieldid.Name,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    new SizedBox(height: 16.0),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(widget.fieldid.Location),
                        new Text(widget.fieldid.Price),
                      ],
                    ),
                    //                 FlatButton(
                    //                child: Text('Book NOW'),
                    //                  onPressed: () {
//                      )

                    SizedBox(
                      height: 20.0,
                    ),
                    DateTimePickerFormField(
                      inputType: InputType.both,
                      format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
                      editable: false,
                      decoration: InputDecoration(
                          labelText: 'Start', hasFloatingPlaceholder: false),
                      onChanged: (dt) {
                        setState(() => start = dt);
                      },
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    DateTimePickerFormField(
                      inputType: InputType.both,
                      format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
                      editable: false,
                      decoration: InputDecoration(
                          labelText: 'Finish', hasFloatingPlaceholder: false),
                      onChanged: (dt) {
                        setState(() => finish = dt);
                      },
                    ),

                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.pink[300],
                        child: Text(
                          'Book',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                         /* diff = finish.difference(start).inHours;
                          diff2 = start.difference(now).inHours;
                          if (0<diff&&10>=diff&&diff2>=2) {
                           await MatchService().addMatch(
                                widget.fieldid.ID,
                                widget.fieldid.Location,
                                start,
                                finish,
                                widget.fieldid.Price,
                                users,
                                );

                            Navigator.pop(context);
                          } else {
                           Alert(context: context, title: "Error",desc: "Choose suitable time or duration" ).show();
                          }*/
                        }),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}