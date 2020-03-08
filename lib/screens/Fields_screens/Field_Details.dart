import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Providers/FieldsProvider.dart';


class FieldDetails extends StatelessWidget{
  static const routeName = 'field-detail';
@override
  Widget build(BuildContext context) {
    final fieldId =
        ModalRoute.of(context).settings.arguments as String; // is the id!

    final loaddedfields = Provider.of<Fields>(context, listen: false,).findById(fieldId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loaddedfields.Name),
      ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ClipRRect(
                    child: Image(
                      image: AssetImage(loaddedfields.Photo_url),
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
                        new Text(loaddedfields.Name,style: TextStyle(fontSize: 20.0),),
                        new SizedBox(height: 16.0),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(loaddedfields.Location),
                            new Text(loaddedfields.Price),
                          ],
                        ),
                      ],
                    ),
                  ),
             ]
                ,
              ),
            )
        )

    );


  }

}