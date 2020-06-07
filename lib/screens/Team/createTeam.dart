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
           static const routeName = '/createteam';

  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {

  final _formKey = GlobalKey<FormState>();

  String nO_Team ;
  String name , urlphoto=null ;
  List<Field> date=[
    Field (Date: DateTime.now().toString())
  ];
  var uurl='https://image.freepik.com/free-vector/character-football-team-players-holding-trophy_16539-56.jpg';


  @override
  Widget build(BuildContext context) {
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
  
  
                     SizedBox(height: 15.0),
                  RaisedButton(
                    color: Colors.pink[300],
                    child: Text(
                      'Create Team',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                          var id=randomString(20 , includeSymbols: false,  useCharOnce:false );
                          await TeamService().createTeam(id ,name, nO_Team, users , date , urlphoto);
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
      }});

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