import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mmh/app/welcomeCarousel.dart';

class App extends StatelessWidget {
  final divider = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  // private widgets

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text('MMH'),
      actions: _appBarWidgets(context),
    );
  }

  List<Widget> _appBarWidgets(BuildContext context) {
    return <Widget>[
      FlatButton(
        child: Icon(
          Icons.settings,
          size: 30.0,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/app/settings');
        },
      ),
    ];
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _welcomeHeader(),
          SizedBox(height: 20.0),
          _serviceHeader(),
          SizedBox(height: 20.0),
          WelcomeCarousel(),
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 20.0,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            title: Text('Settings'), icon: Icon(Icons.settings))
      ],
    );
  }

  Text _serviceHeader() {
    return Text(
      'We Offer these Services',
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28.0),
    );
  }

  Text _welcomeHeader() {
    return Text(
      'Welcome, Amit',
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
    );
  }
}
