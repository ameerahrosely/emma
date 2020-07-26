import 'package:emma/achievement.dart';
import 'package:emma/userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

final _auth = FirebaseAuth.instance;

class _DashboardScreenState extends State<DashboardScreen> {
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.tag_faces),
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserProfile(user: loggedInUser,);
            }));
          },
        ),
        title: Center(
          child: Image.asset('images/EMMAtrans.png',
              fit: BoxFit.cover, height: 40.0, width: 50.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingsScreen(); //link to settings page
              }));
            },
          ),
        ],
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
            child: Text(
              'Dashboard',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            color: Colors.grey[100],
            width: 500,
            height: 50,
          ),
          SizedBox(
            child: Container(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    color: Colors.black,
                    onPressed: () {},
                    alignment: Alignment.topLeft,
                  ),
                  Text(
                    " Home > Dashboard ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              color: Colors.grey[100].withOpacity(0.5),
              width: 500,
              height: 60,
            ),
          ),
          SizedBox(
            height: 140.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    //Navigator.push(context, MaterialPageRoute(builder:(context) => StartQuiz()));
                  });
                },
                child: Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                  color: Colors.grey[300],
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: ListTile(
                      leading:
                          Icon(Icons.book, size: 60.0, color: Colors.teal[700]),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 15.0),
                        child: Text('Accessing Note',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            )),
                      ),
                      subtitle: LinearPercentIndicator(
                        width: 250.0,
                        lineHeight: 14.0,
                        percent: 0.5,
                        center: new Text("50%",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.teal[400],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 140.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => StartQuiz()));
                  });
                },
                child: Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                  color: Colors.grey[350],
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: ListTile(
                      leading: Icon(Icons.extension,
                          size: 60.0, color: Colors.teal[700]),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text('Quiz',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            )),
                      ),
                      subtitle: LinearPercentIndicator(
                        width: 250.0,
                        lineHeight: 14.0,
                        percent: 0.3,
                        center: new Text("30%",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.teal[400],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 130.0,
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Achievement()));
                });
              },
              child: Card(
                elevation: 5.0,
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                color: Colors.grey[350],
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ListTile(
                    leading: Icon(Icons.card_giftcard,
                        size: 60.0, color: Colors.teal[700]),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text('Achievement',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          )),
                    ),
                    subtitle: LinearPercentIndicator(
                      width: 250.0,
                      lineHeight: 14.0,
                      percent: 0.7,
                      center: new Text("70%",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.teal[400],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context);
        },
        child: Icon(Icons.launch),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

createAlertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text('Sure you want to quit?'),
        content: Text('EMMA will miss you!'),
        actions: <Widget>[
          MaterialButton(
            elevation: 0.5,
            child: Text(
              'No',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => Navigator.of(context).pop(context),
          ),
          MaterialButton(
            elevation: 0.5,
            child: Text(
              'Yes',
              style: TextStyle(color: Colors.teal[800]),
            ),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
