/*import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Providers/FieldsProvider.dart';
import '../../Providers/MatchesProvider.dart';
import '../../models/User.dart';



class FieldDetails extends StatelessWidget{
  static const routeName = 'field-detail';
@override
  Widget build(BuildContext context) {
    final fieldId =
        ModalRoute.of(context).settings.arguments as String; // is the id!

    final loaddedfields = Provider.of<Fields>(context, listen: false,).findById(fieldId);
    final match = Provider.of<matches>(context ,  listen: false);
    final users = Provider.of<User> (context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loaddedfields.Name),
      ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ClipRRect(
                    child: Image(
                      image: AssetImage(loaddedfields.Photo_url),
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
                        new Text(loaddedfields.Name,style: TextStyle(fontSize: 20.0),),
                        new SizedBox(height: 16.0),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(loaddedfields.Location),
                            new Text(loaddedfields.Price),
                          ],
                        ),
      //                 FlatButton(
    //                child: Text('Book NOW'),
  //                  onPressed: () {
//                      )
                    
                  

                      ],
                    ),
                  ),
             ]
                ,
              ),
            )
        )

    );


  }

}*/

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/Fields.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import '../../models/field.dart';
import '../../Services/Match.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class FieldDetails extends StatefulWidget {
  final Field fieldid;

  FieldDetails({this.fieldid});

  @override
  _FieldDetailsState createState() => _FieldDetailsState();
}

class _FieldDetailsState extends State<FieldDetails> {
  DateTime start, finish ;
  int diff,diff2;
  DateTime now=DateTime.now();
bool loading = false;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);
    List<User> users = [
      User(
        ID: user.ID,
      ),
    ];

    
        List<String> startfield = List<String>();
    startfield = widget.fieldid.start_time.map((e) => e.Start_at).toList();
List<String> finishfield = List<String>();
    finishfield = widget.fieldid.finish_time.map((e) => e.Finish_at).toList();
List<String> durationfield = List<String>();
    durationfield = widget.fieldid.duration.map((e) => e.Duration).toList();

List<String> startuser = List<String>();
    startfield = widget.fieldid.start_time.map((e) => e.Start_at).toList();
List<String> finishuser = List<String>();
    finishfield = widget.fieldid.finish_time.map((e) => e.Finish_at).toList();
List<String> durationuser = List<String>();
    durationfield = widget.fieldid.duration.map((e) => e.Duration).toList();



DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
    return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          User userData = snapshot.data;
          return loading? Loading(): Scaffold (
          appBar: AppBar(
            title: Text(durationfield.first),
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
                        format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
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
                        format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mm a"),
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
                            List<String> startuser = List<String>();
                                  startuser = userData.start_time.map((e) => e.Start_at).toList();
                            List<String> finishuser = List<String>();
                                  finishuser =userData.finish_time.map((e) => e.Finish_at).toList();
                            List<String> durationuser = List<String>();
                                   durationuser =userData.duration.map((e) => e.Duration).toList();


                               var duration = start.add(new Duration(hours: 1));
                                List<Field> dur=[
                                Field(Duration:dateFormat.format(duration) ) ];
                                List<Field> starts=[
                                    Field(Start_at:dateFormat.format(start) )
                                  ];
                                  List<Field> finishs=[
                                    Field(Finish_at:dateFormat.format(finish) )
                                  ];

                            if (start.isAfter(finish)) {
                              setState(() {
                                  Alert(context: context, title: "Error",desc:startuser.first ).show();
                              }); }
                             
                              else if(userData.start_time.contains(dateFormat.format(start))||userData.start_time.contains(dateFormat.format(finish))||
                              userData.start_time.contains(dateFormat.format(duration))){
                                 setState(() {
                                  Alert(context: context, title: "Error",desc: 'bb' ).show();
                              });}
                              
                              else if(userData.finish_time.contains(dateFormat.format(start))||userData.finish_time.contains(dateFormat.format(finish))|| 
                              userData.finish_time.contains(dateFormat.format(duration))){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'bb' ).show();
                              });}
                             else  if(userData.duration.contains(dateFormat.format(start))||userData.duration.map((e) => e.duration).contains(dateFormat.format(finish))|| 
                             userData.duration.contains(dateFormat.format(duration))){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'bb' ).show();
                              });}
                             else  if(startfield.contains(dateFormat.format(start))||startfield.contains(dateFormat.format(finish))||
                             startfield.contains(dateFormat.format(duration))){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'cc' ).show();
                              });}
                             else  if(finishfield.contains(dateFormat.format(start))||finishfield.contains(dateFormat.format(finish))||
                             finishfield.contains(dateFormat.format(duration)) ){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'cc' ).show();
                              });}
                             else   if(durationfield.contains(dateFormat.format(start))||durationfield.contains(dateFormat.format(finish))||
                             durationfield.contains(dateFormat.format(duration)) ){
                                setState(() {
                                  Alert(context: context, title: "Error",desc: 'cc' ).show();
                              });}
                           
                             else {
                               var s=dateFormat.format(start);
                               var f= dateFormat.format(finish);
                                await MatchService().addMatch(
                                  widget.fieldid.ID,
                                  widget.fieldid.Location,
                                  s,
                                  f,
                                  widget.fieldid.Price,
                                  users,
                                  );
                                  await FieldService().timestart(widget.fieldid.ID, starts);
                                  await FieldService().timefinish(widget.fieldid.ID, finishs);
                                  await FieldService().duration(widget.fieldid.ID, dur);
                                  await UserService().timestart(userData.ID, starts);
                                  await UserService().timefinish(userData.ID, finishs);
                                  await UserService().duration(userData.ID, dur);
                              Navigator.pop(context);
                           
                        }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          )
          )
          );}else{return Loading();}}
    );
  }
}

