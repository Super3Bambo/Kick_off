import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
import './Droplist.dart' as DropList;
class FieldBook extends StatefulWidget
{
  @override
  _FieldBookState createState() => _FieldBookState();
}

class _FieldBookState extends State<FieldBook>{
  CalendarController _controller ;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        new Text('Wadi Degla',style: TextStyle(fontSize: 20.0),),
                        new SizedBox(height: 16.0),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text('El-Mansheya'),
                            new Text('Feisal'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new TableCalendar(
                    initialCalendarFormat: CalendarFormat.week,
                    startingDayOfWeek: StartingDayOfWeek.saturday,
                    calendarController: _controller,onDaySelected: (date,events){

                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DropList.DropList()),);

                  },),





                ]
                ,
              ),
            )
        )

    );


  }

}