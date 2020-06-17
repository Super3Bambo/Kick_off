import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/team.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_icons/flutter_icons.dart';




class AddLeague extends StatefulWidget {
  final Field fieldid;
//    
  AddLeague({this.fieldid});



//final List<String> imageList = [
//   "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
//   "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
//   "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
// ];


  @override
  _AddLeagueState createState() => _AddLeagueState();
}

class _AddLeagueState extends State<AddLeague> {
  DateTime start, finish ;
  String desc,prize;
  int diff,diff2;
  DateTime now=DateTime.now();
bool loading = false;

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
   // User user =Provider.of(context);

List<Team> team;    

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

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
DateFormat timeFormat = DateFormat("HH:00:00:000");

    
          return  Scaffold (
             key: _scaffoldKey,
          appBar: AppBar(
            title: Text('fd'),
          ),
          
          body: Container(
                      child: Center(
                child: SingleChildScrollView(
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
                      new Padding(
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
                                    Container(
                                      margin: EdgeInsets.only(top:10,),
                                  child:
                                  Icon(FontAwesome.star, size: 20, color: Colors.yellow[800],),),
                                  Container(
                                    margin: EdgeInsets.only(left:110 ,top: 10),
                                        child: Text('sd' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)                             

                                  
                               
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
                                color: Colors.blue[700],
                                child: Text(
                                  'Book',
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
                                        Alert(context:  context, title: "Error",desc:'ds' ).show();
 
                                    }
                                     else if(finish.difference(start).inDays>7){
                                      Alert(context:  context, title: "Error",desc:'ffff' ).show();}


                                    else if(start.isBefore(DateTime.now())){
                                      Alert(context:  context, title: "Error",desc:'nonon' ).show();

                                    }
                                   
                                     else if(  (  !((parsethestart-parsemystart).isNegative) && (parsethestart-parsemystart)!=8) || (parsemystart==parsetheEnd) ){
                                                    Alert(context: _scaffoldKey.currentContext, title: "Error",desc: 'str', ).show();
                                      print(parsemyend);
                                      print(parsemystart);
                                      print(parsethestart);
                                      print(parsetheEnd);
                                          
                                    }
                                     else if(((parsemyend-parsetheEnd)==1||(parsemyend-parsetheEnd)==2)){
                                                    Alert(context: _scaffoldKey.currentContext, title: "Error",desc: 'end', ).show();
                                      print(parsemyend);
                                      print(parsemystart);
                                      print(parsethestart);
                                      print(parsetheEnd);
                                          
                                    }
                                 
                                   else {
    // Subscribe the user to a topic
                                   
                                    // _showNotification();
                                  //  Navigator.pop(context);
                                  _showSnackBar();
                                 
                              }
                                }),
                          ],
                        ),
                          ]),
                      )],
                  ),
                )
            ),
          )
         
    );
  }
}

