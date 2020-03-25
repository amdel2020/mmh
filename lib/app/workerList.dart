import 'package:flutter/material.dart';
import 'package:mmh/arguments/workerListDetails.dart';
import 'package:mmh/models/maids.dart';

class WorkerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  // private widgets
  Widget _appBar(BuildContext context) {
    final WorkerListDetails workerListDetails =
        ModalRoute.of(context).settings.arguments;
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        workerListDetails.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _body(BuildContext context) {
    final WorkerListDetails workerListDetails =
        ModalRoute.of(context).settings.arguments;
    final dummyData = DummyWorkerData();
    final workers = dummyData.workers
        .where((w) => w.serviceType == workerListDetails.serviceType);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search worker',
                contentPadding: EdgeInsets.all(8.0),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              children: workers.map<Widget>((md) {
                return _item(md, context);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(Worker worker, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/app/maidDetails', arguments: worker);
        },
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 5.0,
          child: Row(
            children: <Widget>[
              _itemImage(),
              _itemDetails(worker),
            ],
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _itemDetails(Worker worker) {
    return Expanded(
      flex: 5,
      child: Container(
        height: 180,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                worker.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10.0),
              Text(
                'INR. ${worker.charges}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Avg. Rating. ${worker.rating}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                worker.availability ? 'Available' : 'Not Available',
                style: TextStyle(
                    fontSize: 16.0,
                    color: worker.availability ? Colors.green : Colors.red),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        color: Colors.white,
      ),
    );
  }

  Widget _itemImage() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 70.0,
        ),
      ),
    );
  }
}
