import 'package:flutter/material.dart';

class Owen_Alert {
  BuildContext context;
  Owen_Alert({this.context});

openAlertBox_onebutton(   String title , String content , var buttonColor ) {
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
                             color:  buttonColor,
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
        }
        );
        }



        openAlertBox_twobutton(  String title , String content , var buttonColor1  , var buttoncolor2 , String button_Name , function1() , function2()) {
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: 148,
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            color:  Color(0xff00bfa5),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                               // bottomRight: Radius.circular(32.0)
                                ),
                          ),
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap:() =>function1(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red
                        ),
                        //color: Colors.red,
                        width: 4,
                      ),
                     
                       InkWell(
                        child: Container(
                         
                          width: 148,
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                             color:  Color(0xff00bfa5),
                            borderRadius: BorderRadius.only(
                               // bottomLeft: Radius.circular(32.0),
                                bottomRight: Radius.circular(32.0)),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: ()=>function2(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        );
        }

         openAlertBox_two_buttonWith_Icon( String title , String content , var buttonColor1  , var buttoncolor2 , var iconbutton ,var icon_color) {
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: 148,
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            color:  buttonColor1,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                               // bottomRight: Radius.circular(32.0)
                                ),
                          ),
                          child: Icon(iconbutton ,size:25 , color: icon_color, )
                          // Text(
                          //   "OK",
                          //   style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
                          //   textAlign: TextAlign.center,
                          // ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red
                        ),
                        //color: Colors.red,
                        width: 4,
                      ),
                     
                       InkWell(
                        child: Container(
                         
                          width: 148,
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                             color:  buttoncolor2,
                            borderRadius: BorderRadius.only(
                               // bottomLeft: Radius.circular(32.0),
                                bottomRight: Radius.circular(32.0)),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: ()=>Navigator.pop(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        );
        }
        }