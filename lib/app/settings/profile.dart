import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
        title: Text('Profile'),
      ),
      body: Container(
        child: Center(
          child: Text('Profile page'),
        ),
      ),
    );
  }
}
