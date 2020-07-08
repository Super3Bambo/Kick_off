import 'package:flutter/material.dart';
import 'package:flutter_app/Services/Invations.dart';
import 'package:flutter_app/Services/Payment.dart';
import 'package:flutter_app/models/Payment.dart';
import 'package:provider/provider.dart';

import 'paylistview.dart';



class PaymentsOverview extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {


return StreamProvider<List<Payment>>.value(

      value: PaymentService().matchespayments,

     
        child: Scaffold(
          appBar: AppBar(title:Text('d')),
                  body: Container(
       
            child:PaymentsList() ,
          ),
        ),
      
    );
  }
  }