import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  // local widgets
  Widget _authButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: ButtonTheme(
        height: 50.0,
        child: FlatButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          color: Colors.blue,
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _body() {
    final controller = PageController(initialPage: 0);

    return Flexible(
      child: PageView(
        controller: controller,
        children: <Widget>[
          Center(child: Text('Page 1')),
          Center(child: Text('Page 2')),
          Center(child: Text('Page 3')),
          Center(child: Text('Page 4')),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Row(
      children: <Widget>[
        _authButton('Log In', () {
          Navigator.pushNamed(context, '/signIn');
        }),
        SizedBox(
          width: 0.7,
        ),
        _authButton('Sign Up', () {
          Navigator.pushNamed(context, '/signUp');
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _body(),
            _footer(context),
          ],
        ),
      ),
    );
  }
}
