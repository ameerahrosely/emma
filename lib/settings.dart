// Main Programmer: AMIERRA AMRAN (A17CS0011)

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';
  
  @override
  State<StatefulWidget> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  //final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  bool val1 = false;
  bool val2 = true;
  bool val3 = false;
  bool val4 = true;

  onSwitchValueChanged(bool newVal) {
    setState(() {
      val1 = newVal;
    });
  }

  onSwitchValueChanged2(bool newVal) {
    setState(() {
      val2 = newVal;
    });
  }

  onSwitchValueChanged3(bool newVal) {
    setState(() {
      val3 = newVal;
    });
  }

  onSwitchValueChanged4(bool newVal) {
    setState(() {
      val4 = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text('Settings'),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Divider(),
            buildGeneralSettings(),
            buildChangeUsername(),
            buildChangePassword(),
            buildSoundEffect(),
            buildBackgroundMusic(),
            Divider(),
            buildNotificationSettings(),
            SizedBox(
              child: Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 15.0,
                  top: 15.0,
                ),
                color: Colors.teal.withOpacity(0.5),
                width: 400,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Show Notification',
                      style: TextStyle(fontSize: 15),
                    ),
                    Switch(
                      value: val3,
                      onChanged: (newVal) {
                        onSwitchValueChanged3(newVal);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                color: Colors.teal.withOpacity(0.5),
                width: 400,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Notification Sound',
                      style: TextStyle(fontSize: 15),
                    ),
                    Switch(
                      value: val4,
                      onChanged: (newVal) {
                        onSwitchValueChanged4(newVal);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Container buildNotificationSettings() {
    return Container(
        padding: EdgeInsets.all(10.0),
        width: 400,
        height: 50,
        color: Colors.teal[300].withOpacity(0.5),
        child: Text(
          'Notification Settings',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ));
  }

  SizedBox buildBackgroundMusic() {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 15.0,
        ),
        color: Colors.teal.withOpacity(0.5),
        width: 400,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Background Music',
              style: TextStyle(fontSize: 15),
            ),
            Switch(
              value: val2,
              onChanged: (newVal) {
                onSwitchValueChanged2(newVal);
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSoundEffect() {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        color: Colors.teal.withOpacity(0.5),
        width: 400,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Sound Effect',
              style: TextStyle(fontSize: 15),
            ),
            Switch(
              value: val1,
              onChanged: (newVal) {
                onSwitchValueChanged(newVal);
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildChangePassword() {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Change Password',
            hintText: 'Password',
          ),
        ),
        color: Colors.teal.withOpacity(0.5),
        width: 400,
        height: 50,
      ),
    );
  }

  SizedBox buildChangeUsername() {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Change Username',
            hintText: 'amierraamran',
          ),
        ),
        color: Colors.teal.withOpacity(0.5),
        width: 400,
        height: 80,
      ),
    );
  }

  Container buildGeneralSettings() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'General Settings',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      color: Colors.teal[300].withOpacity(0.5),
      width: 400,
      height: 50,
    );
  }
}
