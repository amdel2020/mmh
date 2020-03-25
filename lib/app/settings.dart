import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.97),
      appBar: _appBar(context),
      body: _body(),
    );
  }

  // private widgets
  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Settings'),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Logout',
            style: TextStyle(fontSize: 16.0),
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
          },
        )
      ],
    );
  }

  Widget _body() {
    final sizedBox = SizedBox(height: 10.0);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _profilePicAndNames(sizedBox),
          sizedBox,
          _profile(),
          _calendar(),
          _paymentOptions(),
          _logout(),
          _helpCentre(),
        ],
      ),
    );
  }

  Widget _calendar() {
    return _settingButton(
        'Calendar',
        Icon(
          Icons.calendar_today,
          color: Colors.blue,
        ),
        () => Navigator.pushNamed(context, '/app/settings/calendar'));
  }

  Widget _helpCentre() {
    return _settingButton(
        'Help Centre',
        Icon(
          Icons.help,
          color: Colors.green,
        ),
        () => Navigator.pushNamed(context, '/app/settings/help'));
  }

  Widget _logout() {
    return _settingButton(
        'Logout',
        Icon(
          Icons.exit_to_app,
          color: Colors.red,
        ),
        () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false));
  }

  Widget _paymentOptions() {
    return _settingButton(
        'Payment Options',
        Icon(
          Icons.payment,
          color: Colors.amber,
        ),
        () => Navigator.pushNamed(context, '/app/settings/payment'));
  }

  Widget _profile() {
    return _settingButton(
        'Profile',
        Icon(
          Icons.account_circle,
          color: Colors.orange,
        ),
        () => Navigator.pushNamed(context, '/app/settings/profile'));
  }

  Widget _profilePicAndNames(SizedBox sizedBox) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 60.0,
          ),
          sizedBox,
          Text(
            'Amit Sharma',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          sizedBox,
          Text(
            'amdel2020@gmail.com',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _settingButton(String text, Icon icon, VoidCallback onTapHandler) {
    return Container(
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.3),
        ),
      ),
      child: InkWell(
        onTap: onTapHandler,
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(Icons.chevron_right),
          leading: icon,
        ),
      ),
    );
  }
}
