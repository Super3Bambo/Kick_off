import 'package:flutter/material.dart';
import 'package:flutter_app/models/Payment.dart';
import 'package:flutter_app/models/Request.dart';
import 'package:provider/provider.dart';

import 'Requestitem.dart';


class RequestsList extends StatefulWidget{
  
  @override
  _RequestsListState createState() => _RequestsListState();
}

class _RequestsListState extends State<RequestsList> {
  @override
  Widget build(BuildContext context) {

    
       final reqs = Provider.of<List<Request>>(context) ?? [];
          return ListView.builder( 
            itemCount: reqs.length,
            itemBuilder: (context, index) {
              return RequestsItem(req: reqs[index],); 
            });
  }
}