import 'package:flutter/material.dart';
import 'package:flutter_app/models/field.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_bar/rating_bar.dart';


class AnalysisField extends StatefulWidget {
  final Field field;
  AnalysisField({ this.field });
 // var dd= (field.start_time.length+widget.field.duration.length).toDouble();
   
  // AnalysisField({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _AnalysisFieldState createState() => _AnalysisFieldState();
}

class _AnalysisFieldState extends State<AnalysisField> {
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
        new CircularSegmentEntry((widget.field.start_time.length+widget.field.duration.length).toDouble(), Colors.green, rankKey: 'Q1'),
        new CircularSegmentEntry(24.0, Colors.red, rankKey: 'Q2'),
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

  Column rate(){
    var temp =widget.field.rate.length;
    temp>3?  temp=3: temp = widget.field.rate.length-1;
              for(var i=0; i>widget.field.rate.length;i++){
             return   Column(
               children: <Widget>[
                 RatingBar.readOnly(
                    initialRating: widget.field.rate.map((e) => e.Rate).elementAt(i).toDouble(),
                    isHalfAllowed: true,
                    halfFilledIcon: Icons.star_half,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                  ),
               ],
             );
              }

  }
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
                 
                   Column(
               children: <Widget>[

                 widget.field.rate.reversed.map((e) => e.Rate).elementAt(0)!=null? RatingBar.readOnly(
                    initialRating: widget.field.rate.reversed.map((e) => e.Rate).elementAt(0).toDouble(),
                    isHalfAllowed: true,
                    size: 28,
                    halfFilledIcon: Icons.star_half,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                  ):Text('hadent rated'),
                  1>=widget.field.rate.length?Text('hadent rated'): RatingBar.readOnly(
                    initialRating: widget.field.rate.reversed.map((e) => e.Rate).elementAt(1).toDouble(),
                    isHalfAllowed: true,
                     size: 28,
                    halfFilledIcon: Icons.star_half,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                  ),
                  
                  2>=widget.field.rate.length?Text('hadent rated'): RatingBar.readOnly(
                    initialRating: widget.field.rate.reversed.map((e) => e.Rate).elementAt(2).toDouble(),
                    isHalfAllowed: true,
                     size: 28,
                    halfFilledIcon: Icons.star_half,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                  ),
               ],
             ),
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
        title: Text('d'),
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
            child: mychart2Items(widget.field.Price.toString(),widget.field.Name,widget.field.Location),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: myCircularItems("Avg Played Hours ",(((widget.field.start_time.length+widget.field.duration.length)/24)*100).toStringAsFixed(2) + ' '+'%'),
          ),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems('Matches Count',(widget.field.start_time.length).toString() + ' '+'Match'),
          ),
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems("Cash Money",((widget.field.start_time.length+widget.field.duration.length)*widget.field.Price).toString() + ' ' +'EGP'),
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