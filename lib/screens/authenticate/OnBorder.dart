import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/Rgester_Complete.dart';
import 'package:onboardme/onboardme.dart';


class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingMe(
      /// Number of Pages for the screens
      numOfPage: 3,

      /// No of colors you want for your screen
      noOfBackgroundColor: 4,

      /// List of background colors => In descending order
      bgColor: [
        Color(0xFF3594DD),
        Color(0xFF4563DB),
        Color(0xFF5036D5),
        Color(0xFF5B16D0),
      ],

      /// List of  Call-to-action action
      ctaText: [
        'Skip',
        'Get Started'
      ],

      /// List that maps your screen content
      screenContent: [
        {
          "Scr 1 Heading" : "Screen 1 Heading Goes Here",
          "Scr 1 Sub Heading" : "Screen 1 Sub Heading Goes Here",
          "Scr 1 Image Path" : "images/5omasy.jpg",
        },
        {
          "Scr 2 Heading" : "Screen 2 Heading Goes Here",
          "Scr 2 Sub Heading" : "Screen 2 Sub Heading Goes Here",
          "Scr 2 Image Path" : "images/5omasy.jpg",
        },
        {
          "Scr 3 Heading" : "Screen 3 Heading Goes Here",
          "Scr 3 Sub Heading" : "Screen 3 Sub Heading Goes Here",
          "Scr 3 Image Path" : "images/5omasy.jpg",
        },
      ],

      /// Bool for Circle Page Indicator
      isPageIndicatorCircle: true,

      /// Home Screen Route that lands after on-boarding
      homeRoute: '/regcomplete',
    ),
    routes: <String, WidgetBuilder>{
      '/regcomplete': (BuildContext context) => completeRegister()
        },
        );
  }
}