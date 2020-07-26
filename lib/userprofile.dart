import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emma/updateProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  State<StatefulWidget> createState() {
    return _UserProfile();
  }
}

final _auth = FirebaseAuth.instance;

class _UserProfile extends State<UserProfile> {
  FirebaseUser loggedInUser;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  String name, bio, phone, email;

  @override
  void initState() {
    super.initState();
    loadUser();
    getCurrentUser();
  }

  Future<void> loadUser() async {
    await Future.delayed(Duration(milliseconds: 0));
    final uid = await getCurrentUID();
    final map =
        await Firestore.instance.collection('users').document(uid).get();
    print(map.data);

    setState(() {
      name = map.data['fullname'];
      bio = map.data['bio'];
      phone = map.data['phone'];
      email = map.data['email'];
    });
    return uid;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: Center(
            child: Text(
              'My Profile',
              style: TextStyle(
                color: Colors.white,
                wordSpacing: 0,
              ),
            ),
          ),
          elevation: 0,
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
          ),
          actions: <Widget>[
            UpdateButton(),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                          image: AssetImage('images/bg.jpg'),
                          fit: BoxFit.cover),
                    ),
                    width: 415.0,
                    height: 280.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AddProfileImage(),
                              Text(
                                name ?? "Loading...",
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 50.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              Text(
                                " Home > Dashboard > User Profile",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 30.0,
                    width: 250.0,
                    child: Divider(
                      color: Colors.teal[200],
                      thickness: 5,
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    color: Colors.teal[50],
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.teal,
                      ),
                      title: Text(
                        bio ?? "Bio",
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.teal[50],
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        phone ?? 'Phone',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    color: Colors.teal[50],
                    child: ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.teal,
                      ),
                      title: Text(
                        email ?? 'Email',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    color: Colors.teal[50],
                    child: ListTile(
                      leading: Icon(
                        Icons.beach_access,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'App Version: 1.2',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // Inserting Divider
                    height: 30.0,
                    width: 250.0,
                    child: Divider(
                      color: Colors.teal[200],
                      thickness: 5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddProfileImage extends StatefulWidget {
  AddProfileImage({Key key}) : super(key: key);

  @override
  _AddProfileImageState createState() => _AddProfileImageState();
}

class _AddProfileImageState extends State<AddProfileImage> {
  File _imageFile;

  Future onImageButtonPressed() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = image;
      print('Image Path $_imageFile');
    });
  }

  Future onSubmitButtonPressed() async {
    String fileName = basename(_imageFile.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  }

  void _onRemoveButtonPressed(ImageSource source) {
    setState(() {
      _imageFile = null;
    });
  }

  Widget _previewImage() {
    return Builder(builder: (context) {
      if (_imageFile != null) {
        return Image.file(_imageFile);
      } else {
        return Image.asset('images/user.png');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: new Stack(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(5.0),
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: ClipOval(
              child: SizedBox(
                  width: 120.0,
                  height: 120.0,
                  child: Center(child: _previewImage())),
            ),
          ),
          new Positioned(
            left: 10.0,
            child: new Container(
              margin: EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0, 0),
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  onImageButtonPressed();
                  final snackBar = SnackBar(
                    content: Text('Image selected, proceed to Save.'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                tooltip: 'Pick Image from Gallery',
              ),
            ),
          ),
          new Positioned(
            bottom: 3.0,
            left: 10.0,
            child: new Container(
              margin: EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0, 0),
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.remove),
                onPressed: () {
                  _onRemoveButtonPressed(ImageSource.gallery);
                  final snackBar = SnackBar(
                    content: Text('Aw! Profile Image Removed'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ),
          new Positioned(
            right: 90.0,
            child: new Container(
              margin: EdgeInsetsDirectional.fromSTEB(80.0, 0.0, 0, 0),
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.check),
                onPressed: () {
                  onSubmitButtonPressed();
                  final snackBar = SnackBar(
                    content: Text('Image Successfully Uploaded!'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.edit),
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UpdateProfile();
          }));
        });
  }
}
