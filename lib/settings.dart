// Main Programmer: AMIERRA BINTI AMRAN (A17CS0011)

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EMMA App',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  //void _doNothing
  
  
  bool val1 = false;
  bool val2 = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        leading: 
        BackButton(
          color: Colors.teal,
        ),
        //  IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: _doNothing,
        // ),
        title: Text('Settings'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Divider(),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'General Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              color: Colors.lightBlue[300].withOpacity(0.5),
              width: 400,
              height: 50,
            ),
            SizedBox(
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Change Username',
                    hintText: 'amierraamran',
                  ),
                ),
                color: Colors.lightBlue.withOpacity(0.5),
                width: 400,
                height: 80,
              ),
            ),
            SizedBox(
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Change Password',
                    hintText: 'Password',
                  ),
                ),
                color: Colors.lightBlue.withOpacity(0.5),
                width: 400,
                height: 50,
              ),
            ),
            SizedBox(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                color: Colors.lightBlue.withOpacity(0.5),
                width: 400,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Sound Effect',
                    style: TextStyle(
                    fontSize: 15 ),
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
            ),
            SizedBox(
              child: Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 15.0,
                ),
                color: Colors.lightBlue.withOpacity(0.5),
                width: 400,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Background Music',
                    style: TextStyle(
                    fontSize: 15 ),
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
            ),
            Divider(),
            Container(
                padding: EdgeInsets.all(10.0),
                width: 400,
                height: 50,
                color: Colors.lightBlue[300].withOpacity(0.5),
                child: Text(
                  'Notification Settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),

                SizedBox(
              child: Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 15.0,
                  top:15.0,
                ),
                color: Colors.lightBlue.withOpacity(0.5),
                width: 400,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Show Notification',
                    style: TextStyle(
                    fontSize: 15 ),
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
            ),

            SizedBox(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                color: Colors.lightBlue.withOpacity(0.5),
                width: 400,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Notification Sound',
                    style: TextStyle(
                    fontSize: 15 ),
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
            ),
          ]),
        ),
      ),
    );
  }
}
