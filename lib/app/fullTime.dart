import 'package:flutter/material.dart';
import 'package:mmh/models/maids.dart';

class FullTimeService extends StatefulWidget {
  @override
  _FullTimeServiceState createState() => _FullTimeServiceState();
}

class _FullTimeServiceState extends State<FullTimeService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
    );
  }

  // private widgets
  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text('Full Time'),
    );
  }

  Widget _body(BuildContext context) {
    final dummyData = DummyMaidData();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: dummyData.maids.map<Widget>((md) {
            return Card(
              elevation: 5.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 150,
                      child: Icon(
                        Icons.account_circle,
                        size: 120.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              md.name,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'INR. ${md.charges}',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Avg. Rating. ${md.rating}',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              md.availability ? 'Available' : 'Not Available',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: md.availability ? Colors.green : Colors.red
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              color: Color.fromRGBO(0, 172, 233, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
