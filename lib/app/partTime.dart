import 'package:flutter/material.dart';

class PartTimeService extends StatefulWidget {
  @override
  _PartTimeServiceState createState() => _PartTimeServiceState();
}

class _PartTimeServiceState extends State<PartTimeService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

  // private widgets
  Widget _appBar() {
    return AppBar(
      title: Text('Part Time'),
    );
  }
}
