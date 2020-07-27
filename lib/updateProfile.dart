//Main Programmer: Ameerah Nabihah binti Rosely
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
  final db = Firestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

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

  void updateData() async {
    final uid = await getCurrentUID();
    await db.collection('users').document(uid).updateData({
      'fullname': _nameController.text.toString(),
      'phone': _phoneController.text.toString(),
      'bio': _bioController.text.toString()
    });
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
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
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
                    color: Colors.white,
                    width: 330,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.mail, color: Colors.teal[900]),
                        Text(
                          ' Email: ' + loggedInUser.email,
                          style: TextStyle(
                            color: Colors.teal[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                Material(
                  elevation: 10.0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      onSaved: (value) => name = value,
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Fullname',
                        labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        hintText: 'Enter name here',
                      ),
                    ),
                    color: Colors.white,
                    width: 330,
                    height: 70,
                  ),
                ),
              ]),
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
                child: TextFormField(
                  onSaved: (value) => phone = value,
                  controller: _phoneController,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      hintText: "Enter phone number here"),
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
                child: TextFormField(
                  onSaved: (value) => bio = value,
                  controller: _bioController,
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    hintText: 'Insert your biography',
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
          updateData();
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
    return Text('$name, $email, $phone, $bio, $isMe');
  }
}
