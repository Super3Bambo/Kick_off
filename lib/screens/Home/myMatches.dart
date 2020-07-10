import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Fields_screens/Fields_Overview.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_History.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Rate.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_User.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Progress.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Matches extends StatelessWidget
 
{           

  @override
  Widget build(BuildContext context) {
    // godetails(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverviewProgress()));}
    // godetails2(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverview()));}
    // godetails3(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverview_Complete()));}
    // godetails4(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverview_History()));}

    return  Container(
            child: DefaultTabController(
        length: 5,
        child: Scaffold(
           
                            body: TabBarView(                              
              //controller: controller,
                children: <Widget>[
                  new MatchesOverviewProgress(),
                  new MatchesOverview(),
                  new FieldsOverview(),
                   new MatchesOverview_Rate(),
                  new MatchesOverview_History(),
                 
                ],
                
              ),
            
         
            bottomNavigationBar: Container(
             // margin: EdgeInsets.only(left:80),
                            child: new TabBar(
                  isScrollable: true,
                  
                  //controller: controller,
                  tabs: <Tab>[
                    new Tab(icon: new Icon(FontAwesome.font_awesome, size: 20,),text: 'Matches' ,),
                    new Tab(icon: new Icon(Ionicons.ios_football),text:'my matches'  ),
                    new Tab(icon: new Icon(Icons.add_box,),text:'add match  ' , ),
                    new Tab(icon: new Icon(Icons.star),text: '   Rates  '),
                    new Tab(icon: new Icon(Icons.history),text: ' History '),
                    
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
          

        ),
          ),
      
    );
        
  }
}