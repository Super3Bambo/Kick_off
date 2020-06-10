import 'package:flutter/material.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/models/User.dart';
import '../../models/Matches.dart';
//import './Field_Details.dart';
import './Match_Details_History.dart';
import 'test.dart';

// List<User> temp(BuildContext context , List<String> users  ){
//   List<User> userdata;
//   for(var i=0;i<users.length;i++){
//   StreamBuilder<User>(
//       stream: UserService(userid: users[i]).userData,
//       builder: (context, snapshot){
//         if(snapshot.hasData){
//           User userDatas = snapshot.data;
//          userdata=[
//            User(ID: userDatas.ID ,FName: userDatas.FName ,  )
//          ];
//          return userdata;
          
//           }
// }}}


class MatchItem_History extends StatelessWidget {


  final Match match;
  MatchItem_History({ this.match });

  @override
  Widget build(BuildContext context) {
    List<String> myList = List<String>();
    myList =match.users.map((f)=>f.ID).toList();
    
godetails(Match id){
Navigator.push(context,MaterialPageRoute(builder: (context)=> test333(matchid: match)  ) );

}
    return Card(
  
    margin:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),

  child: ClipRRect(
    
          borderRadius: BorderRadius.circular(20),
  
   child:Column(mainAxisSize: MainAxisSize.min,
   crossAxisAlignment: CrossAxisAlignment.center,
   
   children: <Widget>[
    

     ClipRRect(
          borderRadius: BorderRadius.circular(20),

     child:  GestureDetector(
       onTap: () {
        godetails(match);
       },
       
      // 
     
     
     child: Image.asset('images/5omasy.jpg', height: 200, width: 420, fit: BoxFit.cover, ),),
     ), 
     InkWell(
       onTap: () => godetails(match),
            child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                          child: Container(
                color :Color.fromRGBO(207, 243, 246, 100) ,
                 padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0,0.0),
                       margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),


child: Padding(
        padding: const EdgeInsets.only(bottom: 50 , top: 20) ,

        child: Row(
          children: <Widget>[     
           
              Text(match.Topic),
              Text('data')
              
 ],
   mainAxisAlignment:MainAxisAlignment.spaceBetween,
    mainAxisSize:MainAxisSize.max,
       crossAxisAlignment:CrossAxisAlignment.start,
    
        ),
        )),
            ),
     )
   ],)
   
));
  }
}