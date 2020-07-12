import 'package:flutter/material.dart';
import 'package:flutter_app/Shared/Loading.dart';
import 'package:flutter_app/screens/Payment/payOverview.dart';
import 'package:flutter_app/screens/User/FollowersOverView.dart';
import 'package:flutter_app/screens/User/FollowingOverView.dart';
import 'package:rating_bar/rating_bar.dart';
import '../../screens/User/Edit_User.dart';
import '../../models/User.dart';
import '../../Services/User.dart';
import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';



class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String fName, lName, age, position, area, phone , token,teamid;
  bool loading = false;


  @override
  Widget build(BuildContext context) {
     godetails( ){
Navigator.push(context,MaterialPageRoute(builder: (context)=> PaymentsOverview()  ) );}
/* Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
       
       
       setState(() {
          _image = image;
       });}*/


    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg';

 User user = Provider.of<User>(context);

return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userData = snapshot.data;

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
       
       
      if(image!=null){
        var firebaseStorageRef = FirebaseStorage.instance.ref().child(image.path);
        var uploadTask = firebaseStorageRef.putFile(image);
        var photo = await (await uploadTask.onComplete ).ref.getDownloadURL();
        setState(() {
          loading =true;
        });
         await UserService(userid: user.ID).updateUserData(
                                    fName ?? userData.FName,
                                    lName ?? userData.LName,
                                    age ?? userData.Age,
                                    position ?? userData.Position,
                                    area ?? userData.Area,
                                    phone ?? userData.Phone,
                                    photo.toString(),
                                    teamid ?? userData.TeamID,
                                    token ?? userData.Token,

      );
      loading = false;
      }}



          int sumskills = 0;
          int sumMorality = 0;
          int sumPos = 0;
   userData.rating.map((e) => e.Skills).forEach((int e){sumskills += e;});
      double skillscount= sumskills/userData.rating.length;   
       userData.rating.map((e) => e.Morality).forEach((int e){sumMorality += e;});
      double moralitycount= sumMorality/userData.rating.length;   
       userData.rating.map((e) => e.Position_Skills).forEach((int e){sumPos += e;});
      double poscount= sumPos/userData.rating.length;   
      double total =(skillscount*6+moralitycount*2+poscount)/(3*3);
       return  Stack(children: <Widget>[
       Container(color: Colors.blue,),
       Image.network(imgUrl, fit: BoxFit.fill,),
       BackdropFilter(
          filter:  ui.ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child:  Container(
            decoration: BoxDecoration(
              color:  Colors.blue.withOpacity(0.9),
              //borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),)),
       Scaffold(
          drawer:  Drawer(child:  Container(),),
          backgroundColor: Colors.transparent,
          body:  Center(
            child:  Column(
              children: <Widget>[
            SizedBox(height: _height/12,),

                 InkWell(
                   onTap: ()=>getImage(),
               child:  CircleAvatar(
                   
                    radius: 100,
                    child: ClipOval(
                   child: SizedBox(
                      width: 220.0,
                      height: 220.0,
                          
                  //backgroundImage: NetworkImage(imgUrl),
                 child: (userData.Photo_url!=null)?Image.network(
                          /* --------------------*/  userData.Photo_url,
                            fit: BoxFit.fill,
                          ):Image.network(
                            imgUrl,
                            fit: BoxFit.fill,
                          ),
                          
                 ),),),),

                  

                 SizedBox(height: _height/25.0,),
                 Text(userData.FName + ' ' + '${ userData.LName}', style:  TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                 RatingBar.readOnly(
                    initialRating: total,
                    isHalfAllowed: true,
                    halfFilledIcon: Icons.star_half,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    filledColor: Colors.lime[100],
                    emptyColor: Colors.lime[100],
                    halfFilledColor: Colors.lime[100], 
                  ),
                 Divider(height: _height/30,color: Colors.white,),
                 Container(child:  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: <Widget>[
                    RaisedButton(
              padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                  color: Colors.white,
                  child: Text(
                    'Followers',
                    style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onPressed: ()  {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> FollowersOverview(userid: userData,)  ) );
                      }
                ),
               RaisedButton(
              padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                  color: Colors.white,
                  child: Text(
                    'Following',
                    style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onPressed: ()  {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> FollowingOverview(userid: userData,)  ) );
                      }
                  
                ),
                 RaisedButton(
              padding: EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
                  color: Colors.white,
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onPressed: ()  {
                     Navigator.push(context,MaterialPageRoute(builder: (context)=> Edituser()  ) );
                      }
                  
                ),          //new Icon(Icons.edit),
                   //new SizedBox(width: _width/30,),
                 //   new Text('Edit')
                 ],)),
                 Divider(height: _height/30,color: Colors.white),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children:[
                
                       //margin: EdgeInsets.only(left:8),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Age' ,style: TextStyle(color: Colors.white70,fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(userData.Age ,style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold)),
                     // margin: EdgeInsets.only(left:16),
                     
                   
                  ],),
                  
                  Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Area',style: TextStyle(color: Colors.white70,fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(userData.Area,style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                  ),
                   Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Position',style: TextStyle(color: Colors.white70,fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(userData.Position,style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                  )
                  ,]),
           //   RaisedButton(onPressed: ()=>godetails())
              ],
            ),
          )
      )
    ],
    );
        }else{ return Loading();}
        }
        );
  }
}