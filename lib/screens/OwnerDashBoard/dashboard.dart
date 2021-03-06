import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Auth.dart';
import 'package:flutter_app/screens/League/League_OverView.dart';
import 'package:flutter_app/screens/League/League_dashboard.dart';
import 'package:flutter_app/screens/Matches/Analysis.dart';
import 'package:flutter_app/screens/OwnerDashBoard/Field/Analysis.dart';
import 'package:flutter_app/screens/OwnerDashBoard/OwnerProfile.dart';
import 'package:flutter_app/screens/OwnerDashBoard/test2.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../main.dart';
import 'Field/FieldNavigate.dart';
import 'League/LeagueOverviewowner.dart';
import 'League/League_Navigate.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    godetails(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MyApp()  ) );}
    final AuthService _auth = AuthService();
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: Center(child: Text("Dashboard")),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[

            makeDashboardItem("Profile", Icons.person),
            makeDashboardItem2("Fields", Icons.home),
            makeDashboardItem3('leagues', Icons.card_membership),
            makeDashboardItem4('Log Out', FontAwesome.sign_out),


            // makeDashboardItem4("Add New Field", Icons.create_new_folder),
          ],
        ),
      ),
    );
  }
  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>OwnerProfile() ),);

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.black,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
  Card makeDashboardItem2(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>fieldView() ),);

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.black,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
  Container makeDashboardItem3(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.only(),
      child: Card(
        
          elevation: 1.0,
          margin: new EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
            child: new InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>leagueview()));

              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Center(
                      child: Icon(
                        icon,
                        size: 40.0,
                        color: Colors.black,
                      )),
                  SizedBox(height: 20.0),
                  new Center(
                    child: new Text(title,
                        style:
                        new TextStyle(fontSize: 18.0, color: Colors.black)),
                  )
                ],
              ),
            ),
          )),
    );
  }
  Container makeDashboardItem4(String title, IconData icon) {
    godetails(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MyApp()  ) );}
    final AuthService _auth = AuthService();
    return Container(
      child: Card(
          elevation: 1.0,
          margin: new EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
            child: new InkWell(
              onTap:  () async{ await _auth.signOut();godetails();},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Center(
                      child: Icon(
                        icon,
                        size: 40.0,
                        color: Colors.black,
                      )),
                  SizedBox(height: 20.0),
                  new Center(
                    child: new Text(title,
                        style:
                        new TextStyle(fontSize: 18.0, color: Colors.black)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
