import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/User.dart';
import 'package:flutter_app/models/field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string_one/random_string.dart';
import '../../Shared/Loading.dart';
import '../../Services/Team.dart';
import '../../models/User.dart';
import 'package:provider/provider.dart';

import 'Teams_OverView.dart';

class CreateTeam extends StatefulWidget {
  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {

 bool switchControl = false;
  var textHolder = 'Switch is OFF';

  void toggleSwitch(bool value) {

      if(switchControl == false)
      {
        setState(() {
          switchControl = true;
          textHolder = 'Team Is Private ';
        });
        print(switchControl);
        // Put your code here which you want to execute on Switch ON event.

      }
      else
      {
        setState(() {
          switchControl = false;
           textHolder = 'Team Is Public';
        });
        print(switchControl);
        // Put your code here which you want to execute on Switch OFF event.
      }
  }


  final _formKey = GlobalKey<FormState>();

  String nO_Team ;
  bool private=true;
  String name , urlphoto=null ;
  List<Field> date=[
    Field (Date: DateTime.now().toString())
  ];
  var uurl='https://image.freepik.com/free-vector/character-football-team-players-holding-trophy_16539-56.jpg';


  @override
  Widget build(BuildContext context) {
          final FirebaseMessaging _fcm = FirebaseMessaging();

    User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
  

return StreamBuilder<User>(
      stream: UserService(userid: user.ID).userData,
      builder: (context, snapshot){
        if(snapshot.hasData){
          User userData = snapshot.data;

 return  Container(
   color: Colors.white,
          child: SingleChildScrollView(
             padding: EdgeInsets.symmetric(vertical: 20.0 , horizontal: 50.0),
          child: Form(
            key: _formKey,
             
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:40),),
                InkWell(
                   onTap: ()async{
                var image = await ImagePicker.pickImage(source: ImageSource.gallery);
              if( image!=null){
                var firebaseStorageRef = FirebaseStorage.instance.ref().child( image.path);
                var uploadTask = firebaseStorageRef.putFile( image);
                var photo = await (await uploadTask.onComplete ).ref.getDownloadURL();
                  
                  setState(() {
                   urlphoto=photo;
                  });
                   }},
               child:  CircleAvatar(
                 backgroundColor: Colors.blueAccent,
                    radius: 100,
                    child: ClipOval(
                   child: SizedBox(
                      width: 198.0,
                      height: 198.0,
                          
                  //backgroundImage: NetworkImage(imgUrl),
                //  child: (userData.Photo_url!=null)?Image.network(
                //           /* --------------------*/  userData.Photo_url,
                //             fit: BoxFit.fill,
                //           ):Image.network(
                //             imgUrl,
                //             fit: BoxFit.fill,
                //           ),
                child: (urlphoto!=null)? Image.network(  urlphoto,fit: BoxFit.fill,):Image.network( uurl,fit: BoxFit.fill,),
                
                          
                 ),),),),
              
                Container(
                  margin: EdgeInsets.only(top:19),
                                child: TextFormField(
                    decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Name",
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                    validator: (val) => val.isEmpty ? 'Enter Your Team Name' : null,
                      onChanged: (val) {
                        setState(() => name = val); }
                      ),
                ),
  
              SizedBox(height: 17.0,),
                TextFormField(
                  decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Team counter",
                  border:  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                  validator: (val) => val.isEmpty ? 'Enter Number Of Team' : null,
                    onChanged: (val) {
                      setState(() => nO_Team = val); }
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Statue:        ',style: TextStyle(color:Colors.blue[900] ,fontSize: 20)),
                        Transform.scale( 
                          scale: 1.5,
                          child: Switch(
                          onChanged: toggleSwitch,
                          value: switchControl,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.green,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        )
                  ),
                      ],
                    ), 
                    Text(textHolder , style: TextStyle(color:Colors.redAccent[700] ,fontSize: 17),),
          
  
                     SizedBox(height: 15.0),
                 RaisedButton(
               shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)
                              ),
                              padding: const EdgeInsets.all(0.0),
                              textColor: Colors.white,
                               // color: Colors.blue[700],
                                child: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius:BorderRadius.circular(20) ,
                                                gradient: LinearGradient(
                                                  colors: <Color>[
                                                    Color(0xFF0D47A1),
                                                    Color(0xFF42A5F5),
                                                   
                                                  ],
                                                ),
                                              ),
                                              padding: const EdgeInsets.all(10.0),                                  
                                    child: Text(
                                    '    Create Team    ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                          var id=randomString(20 , includeSymbols: false,  useCharOnce:false );
                          var topic=randomString(6,includeSymbols: false,useCharOnce: false);
                           await _fcm.subscribeToTopic(topic); 
                          await TeamService().createTeam(id ,name, nO_Team, users ,topic, date , urlphoto!=null?urlphoto:uurl , user.ID , switchControl);
                          await UserService(userid: user.ID).updateUserData(userData.FName, userData.LName, userData.Age, userData.Position, userData.Area, userData.Phone, 
                          userData.Photo_url, id, userData.Token);
                      // Navigator.push(context,MaterialPageRoute(builder: (context)=> Teams_OverView()  ) );
  
                          }
                        }
                      
                    
                  ),
            ]
          )
          )
  
  
  )
  
  );
      }else{return Loading();}});

    /*final teamName = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Your Team Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
          ),
    );
    final members = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Members",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final area = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Area",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final createTeamButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xffeceff1),
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          //Navigator.of(context).pushNamed('/homepage');
        },
        child: Text("Create Team",
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      body: Center(child: Container(
        color: Colors.indigoAccent,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 45.0),
              SizedBox(height: 45.0),
              teamName,
              SizedBox(height: 25.0),
              members,
              SizedBox(
                height: 15.0,
              ),
              area,
              SizedBox(
                height: 15.0,
              ),
              createTeamButton,
            ],
          ),
        ),
      ),
      ),
    );*/
  }
}