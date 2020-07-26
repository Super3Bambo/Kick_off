import 'package:flutter/material.dart';
import 'package:flutter_app/screens/authenticate/Rgester_Complete.dart';
import 'package:onboardme/onboardme.dart';


class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Center(
              child: OnboardingMe(
        /// Number of Pages for the screens
        numOfPage: 3,

        /// No of colors you want for your screen
        noOfBackgroundColor: 4,

        /// List of background colors => In descending order
        bgColor: [
          Color(0xFF3594DD),
          Color(0xFF4563DB),
          Color(0xFF5B16D0),
          Color(0xFF4563DB),
        ],

        /// List of  Call-to-action action
        ctaText: [
          'Skip',
          'Get Started'
        ],

        /// List that maps your screen content
        screenContent: [
          {
            "Scr 1 Heading" : "Football",
            "Scr 1 Sub Heading" : "Our rounded leather",
            "Scr 1 Image Path" : "images/balls.jpg",
          },
          {
            "Scr 2 Heading" : "Fields",
            "Scr 2 Sub Heading" : "Our theatre",
            "Scr 2 Image Path" : "images/stadium.jpg",
          },
          {
            "Scr 3 Heading" : "Happiness",
            "Scr 3 Sub Heading" : "Football is our passion",
            "Scr 3 Image Path" : "images/fans.jpg",
          },
        ],

        /// Bool for Circle Page Indicator
        isPageIndicatorCircle: true,

        /// Home Screen Route that lands after on-boarding
        homeRoute: '/regcomplete',
        homeRoute2: '/regcomplete',
      //  homeRoute2:'/regcomplete',
    ),
      ),
    routes: <String, WidgetBuilder>{
      '/regcomplete': (BuildContext context) => completeRegister(),
      '/regcomplete': (BuildContext context) => completeRegister()
        },
        );
  }
}