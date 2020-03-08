import 'package:flutter/material.dart';
import 'package:mmh/app/app.dart';
import 'package:mmh/app/fullTime.dart';
import 'package:mmh/app/onDemand.dart';
import 'package:mmh/app/partTime.dart';
import 'package:mmh/app/settings.dart';
import 'package:mmh/auth/signInPage.dart';
import 'package:mmh/auth/signUpPage.dart';
import 'package:mmh/landingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Raleway'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/app': (context) => App(),
        '/app/fullTime': (context) => FullTimeService(),
        '/app/partTime': (context) => PartTimeService(),
        '/app/onDemand': (context) => OnDemandService(),
        '/app/onDemand': (context) => OnDemandService(),
        '/app/settings': (context) => Settings(),
      },
    );
  }
}
