import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class UpdateProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UpdateProfileState();
  }
}

class _UpdateProfileState extends State<UpdateProfile> {
  String name, email, phone, bio;
  final _auth = FirebaseAuth.instance;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.teal[200],
        ),
        title: Text('Update'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            StreamBuilder(
              stream: _firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightGreenAccent,
                    ),
                  );
                }
                final users = snapshot.data.documents;
                List<UserDetail> detailWidgets = [];
                for (var user in users) {
                  final userName = user.data['fullname'];
                  final userEmail = user.data['email'];
                  final userPhone = user.data['phone'];
                  final userBio = user.data['bio'];

                  final currentUser = loggedInUser.email;

                  if (currentUser == userEmail) {}

                  final detailWidget = UserDetail(
                    name: userName,
                    email: userEmail,
                    phone: userPhone,
                    bio: userBio,
                    isMe: currentUser == userEmail,
                  );
                  detailWidgets.add(detailWidget);
                }
                return Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TypewriterAnimatedTextKit(
                          speed: Duration(seconds: 1),
                          text: ['User Profile  '],
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    color: Colors.teal,
                    width: 400,
                    height: 50,
                  ),
                  Material(
                    elevation: 10.0,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      margin: EdgeInsets.all(20),
                      child: TextField(
                        onChanged: (value) => name = value,
                        decoration: InputDecoration(
                          labelText: 'Fullname',
                          labelStyle: TextStyle(
                              color: Colors.teal,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          //hintText: '$name',
                        ),
                      ),
                      color: Colors.white,
                      width: 330,
                      height: 70,
                    ),
                  ),
                ]);
              },
            ),
            Divider(),
            Material(
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                margin: EdgeInsets.all(20),
                color: Colors.white,
                width: 330,
                height: 70,
                child: TextField(
                  onChanged: (value) => phone = value,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    //hintText: '$email',
                  ),
                ),
              ),
            ),
            Divider(),
            Material(
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                margin: EdgeInsets.all(20),
                color: Colors.white,
                width: 330,
                height: 70,
                child: TextField(
                  onChanged: (value) => bio = value,
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    //hintText: '$bio',
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        heroTag: null,
        onPressed: () {
          _firestore.collection('users').add({
            'bio': bio,
            'email': loggedInUser.email,
            'fullname': name,
            'phone': phone,
          });
          setState(() {
            Navigator.pop(context);
          });
        },
        label: Text('Update'),
        icon: Icon(Icons.check_circle),
      ),
    );
  }
}

class UserDetail extends StatelessWidget {
  UserDetail({this.name, this.email, this.phone, this.bio, this.isMe});

  final String name;
  final String email;
  final String phone;
  final String bio;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Text('$name, $email, $phone, $isMe');
  }
}
