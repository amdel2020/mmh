import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mmh/app/tracker.dart';
import 'package:mmh/app/welcomeCarousel.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final divider = SizedBox(height: 10);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _appBar(BuildContext context) {
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
    switch (_selectedIndex) {
      case 0:
        return _home();
      case 1:
        return Tracker();
      default:
        return _home();
    }
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Tracker'),
          icon: Icon(Icons.track_changes),
        )
      ],
    );
  }

  Widget _home() {
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

  Widget _serviceHeader() {
    return Text(
      'We Offer these Services',
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28.0),
    );
  }

  Widget _welcomeHeader() {
    return Text(
      'Welcome, Amit',
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
    );
  }

  // Private methods
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
