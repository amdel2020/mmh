import 'package:flutter/material.dart';
import 'package:mmh/app/dateTimePicker.dart';
import 'package:mmh/models/maids.dart';
import 'package:mmh/models/services.dart';

class WorkerDetails extends StatefulWidget {
  @override
  _WorkerDetailsState createState() => _WorkerDetailsState();
}

class _WorkerDetailsState extends State<WorkerDetails> {
  final _sizedBox = SizedBox(height: 8.0);
  DateTime _fromDate = DateTime.now();
  TimeOfDay _fromTime = const TimeOfDay(hour: 7, minute: 28);
  DateTime _toDate = DateTime.now();
  TimeOfDay _toTime = const TimeOfDay(hour: 7, minute: 28);

  @override
  Widget build(BuildContext context) {
    final Worker worker = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: _appBar(worker.name),
        body: _body(worker),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.lightBlueAccent,
          elevation: 19.0,
          onPressed: () => _onBookClick(worker),
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
    return SingleChildScrollView(
      child: Column(
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
      ),
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

  Widget _fromDateTime() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DateTimePicker(
        labelText: 'From',
        selectedDate: _fromDate,
        selectedTime: _fromTime,
        selectDate: (DateTime date) {
          setState(() {
            _fromDate = date;
          });
        },
        selectTime: (TimeOfDay time) {
          setState(() {
            _fromTime = time;
          });
        },
      ),
    );
  }

  Widget _image() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: CircleAvatar(
            radius: 100.0,
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

  Widget _toDateTime() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DateTimePicker(
        labelText: 'To',
        selectedDate: _toDate,
        selectedTime: _toTime,
        selectDate: (DateTime date) {
          setState(() {
            _toDate = date;
          });
        },
        selectTime: (TimeOfDay time) {
          setState(() {
            _toTime = time;
          });
        },
      ),
    );
  }

  Widget _timeSlots() {
    return MediaQuery.removePadding(
      context: context,
      child: SafeArea(
        child: Scaffold(
          bottomSheet: Container(
            color: Colors.lightBlue,
            width: double.infinity,
            height: 55.0,
            child: FlatButton(
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 18.0),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          appBar: AppBar(
            title: Text(
              'Select time slot',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _fromDateTime(),
                SizedBox(height: 16.0),
                _toDateTime(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // private methods
  void _onBookClick(Worker worker) {
    switch (worker.serviceType) {
      case ServiceType.FULLTIME:
        {
          print('full time');
          break;
        }
      case ServiceType.PARTTIME:
        {
          Navigator.push<void>(
            context,
            MaterialPageRoute(
              builder: (context) => _timeSlots(),
              fullscreenDialog: true,
            ),
          );
          break;
        }
      case ServiceType.ONDEMAND:
        {
          print('on demand');
          break;
        }
      default:
        {
          break;
        }
    }
  }
}
