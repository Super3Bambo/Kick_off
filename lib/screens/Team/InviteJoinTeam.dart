import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Team.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/models/User.dart';
import 'package:flutter_app/models/team.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class TeamIteminvite extends StatefulWidget {
  Team team ;
  User userData;
TeamIteminvite({this.team , this.userData});

  @override
  _TeamIteminviteState createState() => _TeamIteminviteState();
}

class _TeamIteminviteState extends State<TeamIteminvite> {
    final GlobalKey<ScaffoldState> _scaffoldKeys = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    openAlertBox( String Title , String Content) {
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
                        Title,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: <Widget>[
                      //     Icon(
                      //       Icons.star_border,
                      //       color:  Color(0xff00bfa5),
                      //       size: 30.0,
                      //     ),
                      //     Icon(
                      //       Icons.star_border,
                      //       color:  Color(0xff00bfa5),
                      //       size: 30.0,
                      //     ),
                      //     Icon(
                      //       Icons.star_border,
                      //       color:  Color(0xff00bfa5),
                      //       size: 30.0,
                      //     ),
                      //     Icon(
                      //       Icons.star_border,
                      //       color:  Color(0xff00bfa5),
                      //       size: 30.0,
                      //     ),
                      //     Icon(
                      //       Icons.star_border,
                      //       color:  Color(0xff00bfa5),
                      //       size: 30.0,
                      //     ),
                      //   ],
                      // ),
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
                      child: Text(Content,maxLines: 2, style: 
                      TextStyle(wordSpacing: 1.5 ,height: 2 ,fontWeight: FontWeight.bold),),
                    ),
                    // child: TextField(
                      
                    //   decoration: InputDecoration(
                        
                    //     hintText: "fdjignfdkgnfdkjgndfl;gmfdjlkighsdlf",
                    //     border: InputBorder.none,
                    //   ),
                    //   maxLines: 5,
                    // ),
                  ),
                       
                       InkWell(
                        child: Container(
                         
                          //width: 148,
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                             color:  Colors.blue[300],
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
                      ),


                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.center ,
                  //   children: <Widget>[
                  //     InkWell(
                  //       child: Container(
                  //         width: 148,
                  //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  //         decoration: BoxDecoration(
                  //           color:  Color(0xff00bfa5),
                  //           borderRadius: BorderRadius.only(
                  //               bottomLeft: Radius.circular(32.0),
                  //              // bottomRight: Radius.circular(32.0)
                  //               ),
                  //         ),
                  //         child: Text(
                  //           "OK",
                  //           style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.red
                  //       ),
                  //       //color: Colors.red,
                  //       width: 4,
                  //     ),
                     
                  //      InkWell(
                  //       child: Container(
                         
                  //         width: 148,
                  //         padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  //         decoration: BoxDecoration(
                  //            color:  Color(0xff00bfa5),
                  //           borderRadius: BorderRadius.only(
                  //              // bottomLeft: Radius.circular(32.0),
                  //               bottomRight: Radius.circular(32.0)),
                  //         ),
                  //         child: Text(
                  //           "Cancel",
                  //           style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //       onTap: (){},
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        });}
        DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:00:00:000");
           List<User> users =[
          User(ID: widget.userData.ID)];

   return Scaffold(
     key: _scaffoldKeys,
     backgroundColor:Colors.blue[200] ,
     appBar: AppBar(title:Text(widget.team.Name+' ' +'team')),
        body: Container(
            margin: EdgeInsets.fromLTRB(10.0, 18.0, 10.0, 10.0),
                    child: SingleChildScrollView(
                                        child: Center(
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                   // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new ClipRRect(
                          child: /*Image(
                            image: AssetImage('images/5omasy.jpg'),
                            fit: BoxFit.cover,
                          ),*/
                                       Container(
                                        margin: EdgeInsets.all(9.0), 
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            child: widget.team.Photo!=null? Image.network( widget.team.Photo ,fit: BoxFit.cover, width: 400,height: 280,
                          ):Image.network( 'https://image.freepik.com/free-vector/character-football-team-players-holding-trophy_16539-56.jpg' ,fit: BoxFit.cover),
                                          ),
                                        )
                                       
                        ),
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
                                    Icon(FontAwesome.calendar, size: 20, color: Colors.blueAccent,semanticLabel:'Found' ,), ),
                                    Container(
                                      margin: EdgeInsets.only(left:110 ,top: 10),
                                          child: Text(dateFormat.format(widget.team.Date.toDate()).substring(0,11) ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                                    
                                 
                                  ],),
                                   Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                     mainAxisAlignment:MainAxisAlignment.start,

                                    children: <Widget>[
                                       Container(
                                        margin: EdgeInsets.only(top:10,),
                                    child: Icon(FontAwesome.sort_numeric_asc , size: 20, color: Colors.blue,),),
                                    Container(
                                      margin: EdgeInsets.only(left:110, top: 10),
                                          child: Text( widget.team.users.length.toString() +' of ' + widget.team.NO_team ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
)
                                    
                                    
                                  ],),
                                 
                                   Container(
                                   margin: EdgeInsets.only(top:15,bottom: 10) ,
                                   child:Row(
                                     mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                mainAxisSize:MainAxisSize.max,
                                crossAxisAlignment:CrossAxisAlignment.start,
                                     children: <Widget>[
                                        Text('ATTACK' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                     Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: new LinearPercentIndicator(
                                          width: 250,
                                          animation: true,
                                          lineHeight: 18.0,
                                          animationDuration: 2000,
                                          percent: .35,
                                          center: Text('35%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                          progressColor: Colors.redAccent[700],
                                          backgroundColor: Colors.white70,
                                        ),
                                      ),
                                 // IconToggle(value: true ,activeColor: Colors.yellow,),
                                ],

                              ),),
                                   Container(
                                   margin: EdgeInsets.only(top:15,bottom: 10) ,
                                   child:Row(
                                     mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                mainAxisSize:MainAxisSize.max,
                                crossAxisAlignment:CrossAxisAlignment.start,
                                     children: <Widget>[
                                        Text('MIDFIELDER' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                     Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: new LinearPercentIndicator(
                                          width: 250,
                                          animation: true,
                                          lineHeight: 18.0,
                                          animationDuration: 2000,
                                          percent: .35,
                                          center: Text('35%' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                          progressColor: Colors.green[900],
                                          backgroundColor: Colors.white70,
                                        ),
                                      ),
                                 // IconToggle(value: true ,activeColor: Colors.yellow,),
                                ],

                              ),),
                                   Container(
                                   margin: EdgeInsets.only(top:15,bottom: 0) ,
                                   child:Row(
                                     mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                mainAxisSize:MainAxisSize.max,
                                crossAxisAlignment:CrossAxisAlignment.start,
                                     children: <Widget>[
                                        Text('DEFENCE' ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                     Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: new LinearPercentIndicator(
                                          width: 250,
                                          animation: true,
                                          lineHeight: 18.0,
                                          animationDuration: 2000,
                                          percent: .35,
                                          center: Text( '35%',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                          progressColor: Colors.blue[400],
                                          backgroundColor: Colors.white70,
                                        ),
                                      ),

                                      
                                 // IconToggle(value: true ,activeColor: Colors.yellow,),
                                ],

                              ),),
                                       Container(
                                      margin: EdgeInsets.only(top: 20 ),
                                      child:FlatButton(
                                  color: Colors.pink[300],
                                  child: Text(
                                    'Join',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    
                                    if(widget.userData.TeamID==null || widget.userData.TeamID==""){
                                      await   TeamService().joinTeam(widget.team.ID, users);
                    await UserService(userid: widget.userData.ID).updateUserData(widget.userData.FName, widget.userData.LName, widget.userData.Age, widget.userData.Position, widget.userData.Area, widget.userData.Phone, 
                          widget.userData.Photo_url, widget.team.ID, widget.userData.Token);
                                      
                                    }else{
                                                                            openAlertBox('Wrong' , 'You Already in Another Team');

                                      
                                    }
                                  
                                  }
                      
                    ),),
                                ],
                              ),

                              
                              new Row(
                             mainAxisAlignment:MainAxisAlignment.center,

                                children: <Widget>[
                                 
                                ])])
                                ),
                                  
                                ]
                                )
                                )
                                )
                                ),
   );
    
/*godetails(Team id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> TeamBoard(team: team)  ) );}
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
         onTap: () => godetails(team), 
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(team.Name),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(team.NO_team),
      ),
    )
    );*/
        

  }
}