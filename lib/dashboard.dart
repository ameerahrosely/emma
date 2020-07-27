import 'package:emma/achievement.dart';
import 'package:emma/login.dart';
import 'package:emma/quizmain.dart';
import 'package:emma/userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_notes.dart';
import 'settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _auth = FirebaseAuth.instance;
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
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Center(
          child: Image.asset('images/EMMAtrans.png',
              fit: BoxFit.cover, height: 40.0, width: 50.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.tag_faces),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UserProfile(user: loggedInUser);
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
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 130.0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.teal[300],
                              border: new Border.all(
                                color: Colors.teal,
                                width: 5.0,
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: SizedBox(
                                width: 97,
                                child: Center(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/notepad.png"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return NotesMain(); //navigate to notes
                                }));
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                          child: Text("Access Notes",
                              style: TextStyle(
                                fontFamily: 'Carme',
                                fontSize: 15.0,
                                letterSpacing: 1.5,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 130.0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.teal[300],
                              border: new Border.all(
                                color: Colors.teal,
                                width: 5.0,
                              ),
                            ), // button color
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: SizedBox(
                                width: 97,
                                //height: 3.0,
                                child: Center(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("images/puzzle.png"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return StartQuiz(); //navigate to quiz
                                }));
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                          child: Text("Quiz",
                              style: TextStyle(
                                fontFamily: 'Carme',
                                fontSize: 15.0,
                                letterSpacing: 1.5,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 130.0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.teal[300],
                              border: new Border.all(
                                color: Colors.teal,
                                width: 5.0,
                              ),
                            ), // button color
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: SizedBox(
                                width: 97,
                                //height: 3.0,
                                child: Center(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/trophy.png")))),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Achievement(); //tukar ke achievement
                                }));
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                          child: Text("Achievements",
                              style: TextStyle(
                                fontFamily: 'Carme',
                                fontSize: 15.0,
                                letterSpacing: 1.5,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 130.0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.teal[300],
                              border: new Border.all(
                                color: Colors.teal,
                                width: 5.0,
                              ),
                            ), // button color
                            child: InkWell(
                              splashColor: Colors.red, // inkwell color
                              child: SizedBox(
                                width: 97,
                                //height: 3.0,
                                child: Center(
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/gear.png")))),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SettingsScreen(); //link to settings page
                                }));
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                          child: Text(
                        "Settings",
                        style: TextStyle(
                          fontFamily: 'Carme',
                          fontSize: 15.0,
                          letterSpacing: 1.5,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ],
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
            MaterialButton(onPressed: () {
              _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginEmma()),
              );
            })
          ],
        );
      },
    );
  }
}
