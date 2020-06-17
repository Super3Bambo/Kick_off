import 'package:flutter/material.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_app/models/league.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_bar/rating_bar.dart';


class AnalysisLeague extends StatefulWidget {
  final League league;
  AnalysisLeague({ this.league });
 // var dd= (field.start_time.length+widget.field.duration.length).toDouble();
   
  // AnalysisField({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _AnalysisLeagueState createState() => _AnalysisLeagueState();
}

class _AnalysisLeagueState extends State<AnalysisLeague> {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0,-2.0,3.5,-2.0,0.5,0.7,0.8,1.0,2.0,3.0,3.2];


  Material myTextItems(String title, String subtitle){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
               children: <Widget>[

                  Padding(
                   padding: EdgeInsets.all(8.0),
                      child:Text(title,style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),),
                    ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle,style:TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),

               ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material myCircularItems(String title, String subtitle){
    List<CircularStackEntry> fielddata = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry((widget.league.teams.length).toDouble(), Colors.green, rankKey: 'Q1'),
        new CircularSegmentEntry((8-widget.league.teams.length).toDouble(), Colors.red, rankKey: 'Q2'),
      ],
      rankKey: 'Average Played Hours in Day',
    ),
  ];
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle,style:TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),

                  Padding(
                    padding:EdgeInsets.all(8.0),
                    child:AnimatedCircularChart(
                      size: const Size(100.0, 100.0),
                      initialChartData: fielddata,
                      chartType: CircularChartType.Pie,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ), 
      ),
    );
  }

  // Column rate(){
  //   var temp =widget.field.rate.length;
  //   temp>3?  temp=3: temp = widget.field.rate.length-1;
  //             for(var i=0; i>widget.field.rate.length;i++){
  //            return   Column(
  //              children: <Widget>[
  //                RatingBar.readOnly(
  //                   initialRating: widget.field.rate.map((e) => e.Rate).elementAt(i).toDouble(),
  //                   isHalfAllowed: true,
  //                   halfFilledIcon: Icons.star_half,
  //                   filledIcon: Icons.star,
  //                   emptyIcon: Icons.star_border,
  //                 ),
  //              ],
  //            );
  //             }

  // }
  Material mychart1Items( String priceVal,String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  // Padding(
                  //   padding: EdgeInsets.all(1.0),
                  //   child: Text(title, style: TextStyle(
                  //     fontSize: 20.0,
                  //     color: Colors.blueAccent,
                  //   ),),
                  // ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),),
                  ),
                 
            //        Column(
            //    children: <Widget>[

            //      widget.league.teams.reversed.map((e) => e.).elementAt(0)!=null? RatingBar.readOnly(
            //         initialRating: widget.field.rate.reversed.map((e) => e.Rate).elementAt(0).toDouble(),
            //         isHalfAllowed: true,
            //         size: 28,
            //         halfFilledIcon: Icons.star_half,
            //         filledIcon: Icons.star,
            //         emptyIcon: Icons.star_border,
            //       ):Text('hadent rated'),
            //       1>=widget.field.rate.length?Text('hadent rated'): RatingBar.readOnly(
            //         initialRating: widget.field.rate.reversed.map((e) => e.Rate).elementAt(1).toDouble(),
            //         isHalfAllowed: true,
            //          size: 28,
            //         halfFilledIcon: Icons.star_half,
            //         filledIcon: Icons.star,
            //         emptyIcon: Icons.star_border,
            //       ),
                  
            //       2>=widget.field.rate.length?Text('hadent rated'): RatingBar.readOnly(
            //         initialRating: widget.field.rate.reversed.map((e) => e.Rate).elementAt(2).toDouble(),
            //         isHalfAllowed: true,
            //          size: 28,
            //         halfFilledIcon: Icons.star_half,
            //         filledIcon: Icons.star,
            //         emptyIcon: Icons.star_border,
            //       ),
            //    ],
            //  ),
                  // Padding(
                  //   padding: EdgeInsets.all(1.0),
                  //   child: new Sparkline(
                  //     data: data,
                  //     lineColor: Color(0xffff6101),
                  //     pointsMode: PointsMode.all,
                  //     pointSize: 8.0,
                  //   ),
                  // ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material mychart2Items(String title, String priceVal,String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.all(1.0),
                  //   child: new Sparkline(
                  //     data: data1,
                  //     fillMode: FillMode.below,
                  //     fillGradient: new LinearGradient(
                  //       begin: Alignment.topCenter,
                  //       end: Alignment.bottomCenter,
                  //       colors: [Colors.amber[800], Colors.amber[200]],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('League Analysis'),
        actions: <Widget>[
         // IconButton(icon: Icon(FontAwesomeIcons.chartLine), onPressed: () {}),
        ],
      ),
      body:Container(
          color:Color(0xffE5E5E5),
          child:StaggeredGridView.count(
            crossAxisCount: 4,
           crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        children: <Widget>[
         Padding(
            padding: const EdgeInsets.all(8.0),
            child: mychart2Items(widget.league.Name.toString(),widget.league.Start_Date,widget.league.Finish_Date),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: myCircularItems("Joined Teams",((widget.league.teams.length/8)*100).toStringAsFixed(0) +' '+ '%'),
          ),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems('Matches Count',widget.league.teams.length==8?((28).toString() + ' '+'Match'):(0).toString() ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems("Waiting Teams", (8-widget.league.teams.length).toString()),
          ),
          
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: mychart1Items("Last Rates","Togther we Strong"),
          ),

        ],
        staggeredTiles: [
          StaggeredTile.extent(4, 190.0),
          StaggeredTile.extent(2, 250.0),
          StaggeredTile.extent(2, 120.0),
          StaggeredTile.extent(2, 120.0),
          StaggeredTile.extent(4, 250.0),
        ],
      ),
      ),
    );
  }
}