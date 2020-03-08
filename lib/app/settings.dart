import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
    );
  }

  // private widgets
  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text('Settings'),
      actions: <Widget>[
        FlatButton(
          child: Text('Logout'),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
          },
        )
      ],
    );
  }
}
