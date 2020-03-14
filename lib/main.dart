import 'package:flutter/material.dart';
import 'package:mmh/app/app.dart';
import 'package:mmh/app/maidDetails.dart';
import 'package:mmh/app/settings.dart';
import 'package:mmh/app/workerList.dart';
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
        fontFamily: 'Montserrat'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/app': (context) => App(),
        '/app/workerList': (context) => WorkerList(),
        '/app/settings': (context) => Settings(),
        '/app/maidDetails': (context) => WorkerDetails(),
      },
    );
  }
}
