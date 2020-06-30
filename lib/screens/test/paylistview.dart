import 'package:flutter/material.dart';
import 'package:flutter_app/models/Payment.dart';
import 'package:provider/provider.dart';

import 'payitem.dart';


class PaymentsList extends StatefulWidget{
  
  @override
  _PaymentsListState createState() => _PaymentsListState();
}

class _PaymentsListState extends State<PaymentsList> {
  @override
  Widget build(BuildContext context) {

    
       final payment = Provider.of<List<Payment>>(context) ?? [];
          return ListView.builder( 
            itemCount: payment.length,
            itemBuilder: (context, index) {
              return PaymentsItem(pay: payment[index],); 
            });
  }
}