import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:provider/provider.dart';
import 'Friends_Details.dart';
import 'Match_Details_Progress.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class FriendsItem extends StatelessWidget {



  final User friends;
  FriendsItem({ this.friends });

  
  @override
  Widget build(BuildContext context) {
       User user = Provider.of<User>(context);

    godetails(User id){Navigator.push(context,MaterialPageRoute(builder: (context)=> Friends_Details(userid: friends)  ) );}

  
    return Padding(
        
      padding: const EdgeInsets.only(top: 8.0),
      
      child: Card(
        
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(    
          onTap: (){ return godetails(friends);},
        trailing:SingleChildScrollView(
          child: Column(
          children: <Widget>[
            SizedBox(height: 2.0),
              FlatButton(
                color: Colors.pink[400],
                child: Text(
                  'Invite',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: ()  {        Navigator.push(context, MaterialPageRoute(builder: (context) =>  _MainScreen() ),);




                }
                
              ),
          ],
        ),),
        //  onTap: () {IconButton(icon:Icon(Icons.grade), onPressed:(){} );} 
             
          
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('images/5omasy.jpg'),
          ),
         title: Text(friends.FName),
       //   subtitle: Text(match.users.map((f)=>f.ID).toString()),
         subtitle: Text(friends.Age),
      ),
    )
    );

  }
}
class _MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  String _linkMessage;
  bool _isCreatingLink = false;
  String _testString =
      "To test: long press link and then copy and click from a non-browser "
      "app. Make sure this isn't being tested on iOS simulator and iOS xcode "
      "is properly setup. Look at firebase_dynamic_links/README.md for more "
      "details.";

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          if (deepLink != null) {
            Navigator.pushNamed(context, deepLink.path);
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  Future<void> _createDynamicLink(bool short) async {
    setState(() {
      _isCreatingLink = true;
    });

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://kickoff2.page.link',
      link: Uri.parse('https://kickoff2.page.link/invite'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.kick_off',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.google.FirebaseCppDynamicLinksTestApp.dev',
        minimumVersion: '0',
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }

    setState(() {
      _linkMessage = url.toString();
      _isCreatingLink = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Links Example'),
        ),
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: !_isCreatingLink
                          ? () => _createDynamicLink(false)
                          : null,
                      child: const Text('Get Long Link'),
                    ),
                    RaisedButton(
                      onPressed: !_isCreatingLink
                          ? () => _createDynamicLink(true)
                          : null,
                      child: const Text('Get Short Link'),
                    ),
                  ],
                ),
                InkWell(
                  child: Text(
                    _linkMessage ?? '',
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onTap: () async {
                    if (_linkMessage != null) {

                      await launch(_linkMessage);



                    }

                 },
                  onLongPress: () {
                    Clipboard.setData(ClipboardData(text: _linkMessage));
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(content: Text('Copied Link!')),
                    );
                  },
                ),
                Text(_linkMessage == null ? '' : _testString)
              ],
            ),
          );
        }),
      ),
    );
  }
}