import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(String value) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  void _handleSignup() {
    if (!_formKey.currentState.validate()) {
      _showSnackBar('Invalid Data');
      return;
    }

    _showSnackBar('Sign up successful');
    Navigator.pushNamedAndRemoveUntil(
        _scaffoldKey.currentContext, '/app', (r) => false);
  }

  String _validateEmailField(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }

    final emailExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailExp.hasMatch(value)) {
      return 'Email is not valid';
    }

    return null;
  }

  String _validatePhoneField(String value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }

    if (value.length < 10) {
      return 'Phone number is not valid';
    }

    return null;
  }

  String _validatePasswordField(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  Widget _email() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Your email address',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: _validateEmailField,
    );
  }

  Widget _phone() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone',
        hintText: 'Your mobile number',
      ),
      keyboardType: TextInputType.phone,
      validator: _validatePhoneField,
    );
  }

  Widget _password(String text) {
    return TextFormField(
      decoration: InputDecoration(labelText: text),
      obscureText: true,
      validator: _validatePasswordField,
    );
  }

  Widget _divider() {
    return SizedBox(
      height: 16.0,
    );
  }

  Widget _signUpButton() {
    return ButtonTheme(
      height: 40.0,
      child: RaisedButton(
        onPressed: _handleSignup,
        child: Text(
          'Sign Up',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        color: Color.fromRGBO(0, 172, 233, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 172, 233, 1),
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _email(),
                _divider(),
                _phone(),
                _divider(),
                _password('Password'),
                _divider(),
                _password('Confirm Password'),
                _divider(),
                _signUpButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
