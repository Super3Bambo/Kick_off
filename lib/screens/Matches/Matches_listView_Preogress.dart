import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:provider/provider.dart';
import '../../models/Matches.dart';
import './Match_item_progress.dart';
import '../../Services/Match.dart';


class MatchviewProgress extends StatefulWidget {
  @override
  _MatchviewProgressState createState() => _MatchviewProgressState();
 
  final Match matchid;

  MatchviewProgress({this.matchid}); 
}

class _MatchviewProgressState extends State<MatchviewProgress> {
  DateTime now=DateTime.now();
int diff;
  @override
  Widget build(BuildContext context) {
final match = Provider.of<List<Match>>(context) ?? [];


DateTime finish= new Text(widget.matchid.Check_out.toString()) as DateTime;    //final match = Provider.of<List<Match>>(context) ?? [];
   /*  List<Match> match = Provider.of<List<Match>>(context);
User user = Provider.of<User>(context);
    List <User> users=[
    User(ID: user.ID,),
  ];
  List<String> myList = List<String>(2);
                        myList = widget.matchid.users.map((f)=>f.ID).toList();
  String matchId = widget.matchid.ID;
return StreamBuilder<List<Match>>(
      stream: MatchService(documentID: User.ID).matcheses,
      builder: (context, snapshot){
        if(snapshot.hasData){
          List<Match> matcheses = snapshot.data;
          
      DateTime finish=Match.Check_out;*/

    diff=finish.difference(now).inSeconds;

    return ListView.builder(
    

      itemCount: match.length,
      itemBuilder: (context, index) {
        if(  match[index].users.length>0  && match[index].users.length<10&&diff>0){
        return MatchItemProgress(match: match[index]);
        }

      },
    );
  }
}