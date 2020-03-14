import 'package:flutter/material.dart';
import 'package:mmh/models/maids.dart';

class WorkerDetails extends StatefulWidget {
  @override
  _WorkerDetailsState createState() => _WorkerDetailsState();
}

class _WorkerDetailsState extends State<WorkerDetails> {
  final _sizedBox = SizedBox(height: 8.0);

  @override
  Widget build(BuildContext context) {
    final Worker maid = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: _appBar(maid.name),
        body: _body(maid),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 19.0,
          onPressed: () {},
          label: Text(
            'Book',
            style: TextStyle(fontSize: 18.0),
          ),
          icon: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  // private widgets
  Widget _activityArea(String activityArea) {
    return ListTile(
      title: Text(
        'Activity Area',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        activityArea,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _appBar(String name) {
    return AppBar(
      title: Text(name),
      backgroundColor: Colors.white,
    );
  }

  Widget _availability(bool availability) {
    final availabilityText =
        availability ? 'Resource is available' : 'Resource is not available';

    return ListTile(
      trailing: availability
          ? Icon(
              Icons.thumb_up,
              color: Colors.green,
            )
          : Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
      title: Text(availabilityText,
          style: TextStyle(
            fontSize: 18.0,
            color: availability ? Colors.green : Colors.red,
          )),
    );
  }

  Widget _body(Worker maid) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            _image(),
            _sizedBox,
            _name(maid.name),
            _sizedBox,
            _charges(maid.charges),
            _details(maid)
          ],
        ),
      ],
    );
  }

  Widget _charges(double charges) {
    return Text(
      'INR. $charges',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _details(Worker maid) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _experience(maid.experience),
            _activityArea(maid.activityArea),
            _availability(maid.availability),
            _isVerified(maid.isVerified),
          ],
        ),
      ),
    );
  }

  Widget _experience(double experience) {
    return ListTile(
      title: Text(
        'Experience',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        '$experience years',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget _image() {
    return Container(
      color: Color.fromRGBO(0, 172, 233, 1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: CircleAvatar(
            radius: 100.0,
            backgroundImage: NetworkImage(
                'https://react.semantic-ui.com/images/wireframe/image.png'),
          ),
        ),
      ),
    );
  }

  Widget _isVerified(bool isVerified) {
    final verifiedText =
        isVerified ? 'Resource is verified' : 'Resource is not verified';

    return ListTile(
      title: Text(
        verifiedText,
        style: TextStyle(
            color: isVerified ? Colors.green : Colors.red, fontSize: 18.0),
      ),
      trailing: isVerified
          ? Icon(
              Icons.thumb_up,
              color: Colors.green,
            )
          : Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
    );
  }

  Widget _name(String name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
