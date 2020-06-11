import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Fields_screens/Fields_Overview.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_History.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_User.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Complete.dart';
import 'package:flutter_app/screens/Matches/Matches_Overview_Progress.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Matches extends StatelessWidget
 
{           

  @override
  Widget build(BuildContext context) {
    godetails(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverviewProgress()));}
    godetails2(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverview()));}
    godetails3(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverview_Complete()));}
    godetails4(){Navigator.push(context,MaterialPageRoute(builder: (context)=> MatchesOverview_History()));}

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
                   new MatchesOverview_Complete(),
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
        
    

    /*return Scaffold (
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
               Card(
  
    //margin:EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 5.0),
color: Colors.grey[200],
  child: ClipRRect(
  
        borderRadius: BorderRadius.circular(20),
    
     child:Column(mainAxisSize: MainAxisSize.min,
     crossAxisAlignment: CrossAxisAlignment.center,
     
     children: <Widget>[
  

   ClipRRect(
        borderRadius: BorderRadius.circular(20),

   child:  GestureDetector(
     onTap: () => godetails(),
   
   
   child: Image.asset('images/2.jpg', height: 150, width: 170, fit: BoxFit.fill , ),),
   ), 
   InkWell(
     onTap: () => godetails(),
          child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                        child: Container(
              //color :Color.fromRGBO(207, 243, 246, 100) ,
               padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0,0.0),
                     margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


child: Padding(
      padding: const EdgeInsets.only(bottom: 10 , top: 10) ,
      
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text('Available Matches' ,style: TextStyle ( fontWeight: FontWeight.bold , letterSpacing: 1.2 ,color: Colors.blue[600] ),),
        //Icon(FontAwesome.dot_circle_o , size: 12, color: Colors.green,),
        ],
      ),
      ),
      
     

                        )))],
        ),
   )),
                Card(
  
    //margin:EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 5.0),
color: Colors.grey[200],
  child: ClipRRect(
    
          borderRadius: BorderRadius.circular(20),
  
   child:Column(mainAxisSize: MainAxisSize.min,
   crossAxisAlignment: CrossAxisAlignment.center,
   
   children: <Widget>[
    

     ClipRRect(
          borderRadius: BorderRadius.circular(20),

     child:  GestureDetector(
       onTap: () => godetails2(),
     
     
     child: Image.asset('images/1.jpg', height: 150, width: 170, fit: BoxFit.fill, ),),
     ), 
     InkWell(
      onTap: () => godetails2(),
            child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                           child: Container(
              //color :Color.fromRGBO(207, 243, 246, 100) ,
               padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0,0.0),
                     margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


child: Padding(
      padding: const EdgeInsets.only(bottom: 10 , top: 10) ,
      
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text('My Matches' ,style: TextStyle ( fontWeight: FontWeight.bold , letterSpacing: 1.2 ,color: Colors.blue[600] ),),
        //Icon(FontAwesome.dot_circle_o , size: 12, color: Colors.green,),
        ],
      ),
      ),

                          )))],
          ),
     )),
     ],
      ),

      Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
               Card(
  
  //  margin:EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 5.0),

  child: ClipRRect(
    
          borderRadius: BorderRadius.circular(20),
  
   child:Column(mainAxisSize: MainAxisSize.min,
   crossAxisAlignment: CrossAxisAlignment.center,
   
   children: <Widget>[
    

     ClipRRect(
          borderRadius: BorderRadius.circular(20),

     child:  GestureDetector(
 onTap: () => godetails3(),     
     
     child: Image.asset('images/6.png', height: 150, width: 170, fit: BoxFit.fill, ),),
     ), 
     InkWell(
 onTap: () => godetails3(),            child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                           child: Container(
              //color :Color.fromRGBO(207, 243, 246, 100) ,
               padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0,0.0),
                     margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


child: Padding(
      padding: const EdgeInsets.only(bottom: 10 , top: 10) ,
      
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text('Rate Matches' ,style: TextStyle ( fontWeight: FontWeight.bold , letterSpacing: 1.2 ,color: Colors.blue[600] ),),
        //Icon(FontAwesome.dot_circle_o , size: 12, color: Colors.green,),
        ],
      ),
      ),
                          )))],
          ),
     )),
                Card(
  
    //margin:EdgeInsets.fromLTRB(0.0, 55.0, 0.0, 5.0),

  child: ClipRRect(
    
          borderRadius: BorderRadius.circular(20),
  
   child:Column(mainAxisSize: MainAxisSize.min,
   crossAxisAlignment: CrossAxisAlignment.center,
   
   children: <Widget>[
    

     ClipRRect(
          borderRadius: BorderRadius.circular(20),

     child:  GestureDetector(
 onTap: () => godetails4(),     
     
     child: Image.asset('images/3.jpg', height: 150, width: 170, fit: BoxFit.fill, ),),
     ), 
     InkWell(
 onTap: () => godetails4(),            child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                            child: Container(
              //color :Color.fromRGBO(207, 243, 246, 100) ,
               padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0,0.0),
                     margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


child: Padding(
      padding: const EdgeInsets.only(bottom: 10 , top: 10) ,
      
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text('History' ,style: TextStyle ( fontWeight: FontWeight.bold , letterSpacing: 1.2 ,color: Colors.blue[600] ),),
        //Icon(FontAwesome.dot_circle_o , size: 12, color: Colors.green,),
        ],
      ),
      ),

                          )))],
          ),
     )),
     ],
      ),
     /* body: Row(
        children: <Widget>[
          Expanded(
             child: Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                },
                child: Container(
                  
                  padding: const EdgeInsets.all(36.0),
                  width: 300,
                  height: 100,
                  child: Text('Match in Wadi Degla, Friday 8 PM.',
                    style: TextStyle(fontSize: 20.0),),
                ),
              ),
            ),
          ),
        ],
      )*///body: Center(
        /*body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 110.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
              onPressed: () {
                 // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(builder: (context) => FieldsOverview()),);
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  MatchesOverviewProgress() ),);
                },
                child: Text(
                  "Matches On Progress",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
              onPressed: () {
                 // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(builder: (context) => FieldsOverview()),);
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  MatchesOverview() ),);
                },
                child: Text(
                  "My Matches",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
              onPressed: () {
                 // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(builder: (context) => FieldsOverview()),);
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  MatchesOverview_Complete() ),);
                },
                child: Text(
                  "Complete Maches",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
               SizedBox(
                height: 50.0,
              ),
              new FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
              onPressed: () {
                 // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(builder: (context) => FieldsOverview()),);
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  MatchesOverview_History() ),);
                },
                child: Text(
                  "History Matches",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
               
              ],),),*/])
    );*/
  }
}