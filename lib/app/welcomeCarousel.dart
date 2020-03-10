import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mmh/models/services.dart';

class WelcomeCarousel extends StatefulWidget {
  @override
  _WelcomeCarouselState createState() => _WelcomeCarouselState();
}

class _WelcomeCarouselState extends State<WelcomeCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          enlargeCenterPage: true,
          initialPage: 0,
          height: MediaQuery.of(context).size.height * 0.5,
          items: _items(),
          viewportFraction: 0.8,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [1, 2, 3, 4].asMap().entries.map<Widget>(
              (entry) {
                int index = entry.key;

                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4)),
                );
              },
            ).toList(),
          ),
        )
      ],
    );
  }

  // Private widgets
  Text _description(Service i) {
    return Text(
      i.description,
      style: TextStyle(
        fontSize: 20.0,
        wordSpacing: 1.4,
      ),
    );
  }

  RaisedButton _detailButton(BuildContext context, ServiceType serviceType) {
    return RaisedButton(
      onPressed: () => _handleClick(context, serviceType),
      child: Text(
        'Explore',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  Text _header(Service i) {
    return Text(
      i.header,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 30.0,
        wordSpacing: 1.2,
        letterSpacing: 1.1,
      ),
    );
  }

  Card _item(Service i) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _header(i),
            _description(i),
            _detailButton(context, i.serviceType),
          ],
        ),
      ),
      color: Color.fromRGBO(0, 172, 233, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }

  List<Builder> _items() {
    final services = ServiceData();

    return services.serviceData.map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: _item(i),
          );
        },
      );
    }).toList();
  }

  // Private methods
  void _handleClick(BuildContext context, ServiceType type) {
    String routeName = '';

    switch (type) {
      case ServiceType.FULLTIME:
        routeName = '/app/fullTime';
        break;
      case ServiceType.PARTTIME:
        routeName = '/app/partTime';
        break;
      case ServiceType.ONDEMAND:
        routeName = '/app/onDemand';
        break;
      default:
        break;
    }

    Navigator.pushNamed(context, routeName);
  }
}
