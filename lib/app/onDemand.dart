import 'package:flutter/material.dart';

class OnDemandService extends StatefulWidget {
  @override
  _OnDemandServiceState createState() => _OnDemandServiceState();
}

class _OnDemandServiceState extends State<OnDemandService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
    );
  }

  // private widgets
  Widget _appBar() {
    return AppBar(
      title: Text('On Demand'),
    );
  }
}
