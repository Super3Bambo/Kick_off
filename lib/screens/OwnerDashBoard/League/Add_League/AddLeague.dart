import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Services/League.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/team.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';





class AddLeague extends StatefulWidget {
  final Field fieldid;
//    
  AddLeague({this.fieldid});

  @override
  _AddLeagueState createState() => _AddLeagueState();
}

class _AddLeagueState extends State<AddLeague> {
  DateTime start, finish ;
  String desc='',name='';
  int diff,diff2;
       var showstart,showend;
       int prize  ;

  DateTime now=DateTime.now();
bool loading = false;

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    User user =Provider.of(context);

List<Team> team=[];
    penAlertBox_onebutton(   String title , String content ) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(fontSize: 24.0),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 4.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Container(
                        margin: EdgeInsets.only(top:2),
                        height:100,
                        child: Text(content ,maxLines: 2, style:
                        TextStyle(wordSpacing: 1.5 ,height: 2 ,fontWeight: FontWeight.bold),),
                      ),
                    ),

                    InkWell(
                      child: Container(

                        //width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: ()=>Navigator.pop(context),
                    ),],
                ),
              ),
            );
          }
      );
    }

    penAlertBox_onebutton2(   String title , String content ) {
      return showDialog(
          context: _scaffoldKey.currentContext,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(fontSize: 24.0),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 4.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Container(
                        margin: EdgeInsets.only(top:2),
                        height:100,
                        child: Text(content ,maxLines: 2, style:
                        TextStyle(wordSpacing: 1.5 ,height: 2 ,fontWeight: FontWeight.bold),),
                      ),
                    ),

                    InkWell(
                      child: Container(

                        //width: 148,
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color:  Colors.blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: ()=>Navigator.pop(context),
                    ),],
                ),
              ),
            );
          }
      );
    }
_showSnackBar() {
    final snackBar = new SnackBar(
        content: new Text("you out of match Done"),
        duration: new Duration(seconds: 5),
        //backgroundColor: Colors.pink[300],
        action: new SnackBarAction(label: 'Back',
         onPressed: (){
           Navigator.pop(context);
        }),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
      final halfMediaWidth = MediaQuery.of(context).size.width / 2.3;


DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
DateFormat timeFormat = DateFormat("HH:00:00:000");

    
          return  Scaffold (
             key: _scaffoldKey,
          appBar: AppBar(
            title: Text(widget.fieldid.Name),
          ),
          
          body: Container(
            margin: EdgeInsets.only(top:10),
                      child: SingleChildScrollView(
                                              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        // new ClipRRect(
                        //   child:GFCarousel(
                        //           items: widget.imageList.map(
                        //               (url) {
                        //               return Container(
                        //                 margin: EdgeInsets.all(8.0),
                        //                 child: ClipRRect(
                        //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        //                     child: Image.network(
                        //                       url,
                        //                       fit: BoxFit.cover,
                        //                         //width: 1000.0
                        //                     ),
                        //                   ),
                        //                 );
                        //                 },
                        //               ).toList(),
                        //           ),
                        // ),
                        Container(
                          child: new Padding(
                            padding: new EdgeInsets.all(16.0),
                            child: new Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              
                              children: <Widget>[

                                 Column(
                                  children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                   mainAxisAlignment:MainAxisAlignment.start,

                  children: <Widget>[
                    Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top:10,),
                  child:
                  Icon(FontAwesome.hourglass_start, size: 20, color: Colors.yellow[800],),),
                   Container(
                    margin: EdgeInsets.only(left:80 ,top: 10,right: 50),
                          child: Text(widget.fieldid.Start_at.substring(0,5) ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),),
                          
                          
                          
                           Container(
                            margin: EdgeInsets.only(top:10,),
                  child:
                  Icon(FontAwesome.hourglass_end, size: 20, color: Colors.yellow[800],),),
                   Container(
                    margin: EdgeInsets.only(left:80 ,top: 10),
                          child: Text(widget.fieldid.Finish_at.substring(0,5) ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),),    



                        ],
                    ),
                                            

                  
                                   
                ],),
                 Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                   mainAxisAlignment:MainAxisAlignment.start,

                  children: <Widget>[
                     Container(
                        margin: EdgeInsets.only(top:10,),
                  child: Icon( FontAwesome.location_arrow , size: 20, color: Colors.blue,) ,/*Icon( FontAwesome.location_arrow , size: 20, color: Colors.blue,)*/ ),
                  
                  Container(
                    margin: EdgeInsets.only(left:110, top: 10),
                          child: Text(widget.fieldid.Location ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                  
                  
                ],),


                 Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                   mainAxisAlignment:MainAxisAlignment.start,

                  children: <Widget>[
                     Container(
                        margin: EdgeInsets.only(top:10,),
                  child: Icon(FontAwesome.newspaper_o , size: 20, color: Colors.blue,),),
                  Container(
                    margin: EdgeInsets.only(left:110, top: 10),
                          child: Text(widget.fieldid.Name ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                  
                  
                ],),
                                   
 
                                   Container(
                 margin: EdgeInsets.only(top:25,bottom: 10) ,
                 child:Row(
                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                  mainAxisSize:MainAxisSize.max,
                                  crossAxisAlignment:CrossAxisAlignment.start,
                   children: <Widget>[
                  Icon(FontAwesome.bath , size: 30, color: widget.fieldid.Bathroom? Colors.green[900]: Colors.grey[700],),
                  Icon(Ionicons.md_football ,size: 30,color: widget.fieldid.Ball? Colors.green[900]: Colors.grey[700],),
                  Icon(MaterialIcons.person_outline, size: 30,color: widget.fieldid.Refree? Colors.green[900]: Colors.grey[700],),
                                   // IconToggle(value: true ,activeColor: Colors.yellow,),
                                  ],

                                ),),



                                
                                new SizedBox(height: 16.0),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  
                                  ],
                                ),
                             
                                 Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showDateTimePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 300.0,
                              ),
                              showTitleActions: true,
                            
                               onConfirm: (time) {
                           showstart = dateFormat.format(time).substring(0,16);
                            setState(() =>start=time );
                          }, 
                          currentTime: DateTime.now(), locale: LocaleType.en);
                         // setState(() =>start=date );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          size: 18.0,
                                          color: Colors.blue,
                                        ),
                                        Text(showstart==null?' select time':
                                          " $showstart",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Text(
                            "  Change",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                    ),
                    SizedBox(
                        height: 20.0,
                    ),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        elevation: 4.0,
                        onPressed: () {
                          DatePicker.showDateTimePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 300.0,
                              ),
                              showTitleActions: true, onConfirm: (time) {
                           // print('confirm $time');
                           showend = dateFormat.format(time).substring(0,16);
                            setState(() =>finish=time );
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.access_time,
                                          size: 18.0,
                                          color: Colors.blue,
                                        ),
                                        Text( showend==null?' select time':" $showend",
                                         // " $_time",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                             Text(
                            "  Change",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                            ],
                          ),
                        ),
                        color: Colors.white,
                    )
                  ],
                ),
              ),
          ),

           Column(
      
                children: <Widget>[
    
      
                  Container(
      
                    alignment: Alignment.topCenter,
      
                    child: Column(
                      children: <Widget>[
                       
      
                              Container(
      
                                alignment: Alignment.topCenter,
      
      
                                child: MyTextFormField(
      
                                  hintText: 'Name',
      
                                  validator: (String value) {
                                  if (value.isEmpty) {
      
                                return 'Enter name';
      
                              }
      
                              return null;
      
                            },
      
                            onChanged: (String value) {
      
                             setState(() =>name=value );
      
                            },
      
                                ),
      
                              ),
      
                              Container(
      
                                alignment: Alignment.topCenter,
      
      
                                child: MyTextFormField(
                                  minline: 5,
      
                                  hintText: 'Description',
      
                                  validator: (String value) {
      
                                    if (value.isEmpty) {
      
                                     //  return 'Enter your last name';
      
                                    }
      
                                    return null;
      
                                  },
      
                                  onChanged: (String value) {
      
                                   setState(() =>desc=value );
      
                                  },
      
                                ),
      
                              )
      
                            ],
      
                        
                    
                    ),
      
                  ),
      
                  
                   Container(margin: EdgeInsets.only(top:20),
                     child: Slider(
                       label: 'Prize',
                          value: 0.0,
                       // inactiveColor: Colors.blueAccent,
                       // activeColor: Colors.blue,
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                       onChanged: (val) => 
                       setState(() => prize=val.round()),
                      ),
                   ),
                      prize==null?Text('0'+' '+'\$'):Text(prize.toString()+' '+'\$'),

                    ]),

                                SizedBox(height: 20.0),
                                RaisedButton(
                color: Colors.blue[700],
                child: Text(
                  'Add League',
                  style: TextStyle(color: Colors.white),
                ),
                
                onPressed: () async {
                             var starttemp= widget.fieldid.Start_at;
                var temp1 = starttemp.substring(0,2);
                var parsethestart = int.tryParse(temp1);

                 var endtemp =widget.fieldid.Finish_at;
                  var temp2 = endtemp.substring(0,2);
                  var parsetheEnd = int.tryParse(temp2);


                 var getstart=timeFormat.format(start);
                     var temp3 = getstart.substring(0,2);
                     var parsemystart = int.tryParse(temp3);

                   var getend=timeFormat.format(finish);
                     var temp4 = getend.substring(0,2);
                     var parsemyend = int.tryParse(temp4);



                  if (start.isAfter(finish)) {
                     //     Alert(context:  context, title: "Error",desc:'ds' ).show();
                    penAlertBox_onebutton(   'Error' , 'Choose a resonable time');
 
                    }
                     else if(finish.difference(start).inDays<7){
                     //   Alert(context:  context, title: "Error",desc:'ffff' ).show();}
                     penAlertBox_onebutton(   'Error' , 'It should be 7 days at least');}

                    else if(start.isBefore(DateTime.now())){
                       // Alert(context:  context, title: "Error",desc:'nonon' ).show();
                    penAlertBox_onebutton(   'Error' , 'Choose a resonable time');

                    }
                   
                     else if(  (  !((parsethestart-parsemystart).isNegative) && (parsethestart-parsemystart)!=8) || (parsemystart==parsetheEnd) ){
                                   //   Alert(context: _scaffoldKey.currentContext, title: "Error",desc: 'str', ).show();
                    penAlertBox_onebutton2(   'Error' , 'Choose a resonable time');
                        print(parsemyend);
                        print(parsemystart);
                        print(parsethestart);
                        print(parsetheEnd);
                            
                    }
                     else if(((parsemyend-parsetheEnd)==1||(parsemyend-parsetheEnd)==2)){
                                 //     Alert(context: _scaffoldKey.currentContext, title: "Error",desc: 'end', ).show();
                    penAlertBox_onebutton2(   'Error' , 'Choose a resonable time');

                    print(parsemyend);
                        print(parsemystart);
                        print(parsethestart);
                        print(parsetheEnd);
                            
                    }
                 
                   else {
                      var s=dateFormat.format(start);
                      var f= dateFormat.format(finish);
                     LeagueService().addleague(widget.fieldid.ID, s, f, team, prize.toString(), desc, name, user.ID ,widget.fieldid.Location);
    // Subscribe the user to a topic
                   
                    // _showNotification();
                  //  Navigator.pop(context);
                  _showSnackBar();
                 
                                  }
                }),
                              ],
                            ),
                              ]),
                          ),
                        )],
                  )
            ),
                      ),
          )
         
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onChanged;
  final bool isPassword;
  final bool isEmail;
  final int minline;
MyTextFormField({
    this.hintText,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    this.isEmail = false,
    this.minline=1,
  });
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: minline,
        
        
        autofocus: false,
        decoration: InputDecoration(
          //icon: Icon(Icons.chat),
          focusColor: Colors.blue,
          hintText: hintText,
          
          contentPadding: EdgeInsets.all(15.0),
         // border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        
        obscureText: isPassword ? true : false,
        validator: validator,
        onChanged: onChanged,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}