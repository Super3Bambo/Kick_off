import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Fields_screens/Field_Details.dart';
import 'package:flutter_app/screens/Fields_screens/Field_League.dart';
import 'package:flutter_app/screens/Fields_screens/Fields_Overview.dart';
//import 'package:flutter_app/screens/League/Add_League.dart';
import 'package:flutter_app/screens/League/League_OverView.dart';
import 'package:flutter_app/screens/Matches/Analysis.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_History.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_User.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Complete.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Progress.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FieldsBoard extends StatelessWidget

{
  @override
  Widget build(BuildContext context) {
  //  godetails(){Navigator.push(context,MaterialPageRoute(builder: (context)=>Analysis()));}
    godetails2(){Navigator.push(context,MaterialPageRoute(builder: (context)=> FieldDetails()));}
    godetails3(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverview()));}

    return Container(
      child: DefaultTabController(
        length: 3,
        child:
        Container(
          child: Scaffold(

            body:TabBarView(
              //controller: controller,
              children: <Widget>[
                //new Analysis(),
                new FieldDetails(),
                new MatchesOverview(),
              ],

            ),


            bottomNavigationBar: Container(
              // margin: EdgeInsets.only(left:80),
              child: new TabBar(
                isScrollable: true,

                //controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.show_chart, size: 20,),text: 'Analysis' ,),
                  new Tab(icon: new Icon(Icons.add_box),text:'Add a new match'  ),
                  new Tab(icon: new Icon(Ionicons.ios_football),text:'Matches'  ),

                ],
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.all(5.0),
                labelColor: Colors.black,
                indicatorColor: Colors.black87,
                labelStyle: TextStyle(fontSize: 12 ,),


              ),


            ),
            backgroundColor: Colors.grey[200],
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: false,

          ),),),);
  }

}