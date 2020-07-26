// Frontend Programmer: AZRI AMIRAH (A17CS0024)
// Backend Programmer: AMIERRA AMRAN (A17CS0011)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dashboard.dart';
import 'login.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new StartScreen(),
    //home: UserProfile(),
  ));
}

final _firestore = Firestore.instance;
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
Future<String> getCurrentUID() async {
  return (await _firebaseAuth.currentUser()).uid;
}

class StartScreen extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<StartScreen> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      backgroundColor: Colors.black,
      image: Image.asset(
        'images/loading4.gif',
        alignment: Alignment.bottomCenter,
      ),
      loaderColor: Colors.transparent,
      loadingText: Text(
        'EMMA welcomes you onboard...',
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
      ),
      photoSize: 220.0,
      navigateAfterSeconds: SignUpEmma(),
    );
  }
}

class SignUpEmma extends StatefulWidget {
  @override
  SignUpEmmaState createState() {
    return SignUpEmmaState();
  }
}

class SignUpEmmaState extends State<SignUpEmma> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // LOGO
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('images/emma8.png'),
                    ),

                    SizedBox(
                      height: 5.0,
                    ),

                    // Container for CREATE A NEW ACCOUNT text
                    buildRegister(),

                    SizedBox(
                      height: 30.0,
                      width: 200.0,
                      child: Divider(
                        color: Colors.teal,
                      ),
                    ),

                    // INPUT FIELD 2: EMAIL
                    buildInputEmail(),

                    // INPUT FIELD 3: PASSWORD
                    buildInputPassword(),

                    SizedBox(
                      height: 20.0,
                    ),

                    // REGISTER BUTTON
                    // ONPRESSED: LOG IN PAGE
                    SizedBox(
                      width: 325.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.teal,
                        onPressed: () {
                          register();
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'Carme',
                            fontSize: 20.0,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    // BUTTON TO NAVIGATE TO LOGIN PAGE
                    // ONPRESSED: LOG IN PAGE
                    FlatButton(
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginEmma();
                        }));
                      },
                      child: Text(
                        'I am a member of EMMA',
                        style: TextStyle(color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      setState(() {
        showSpinner = true;
      });
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: email.trim(), password: password))
            .user;
             final currentuid = await getCurrentUID();
        _firestore.collection('users').document(currentuid).setData({
          'email': email,
          'password': password
        });

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardScreen(user: user)));

        setState(() {
          showSpinner = false;
        });
      } catch (e) {
        print(e.message);
      }
    }
  }

  Card buildInputPassword() {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          title: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  fontFamily: 'Carme',
                )),
            keyboardType: TextInputType.visiblePassword,
            validator: (String arg) {
              if (arg.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            // onChanged: (value) {
            //   password = value;
            // },
            onSaved: (value) => password = value,
          ),
        ));
  }

  Card buildInputEmail() {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
        color: Colors.white,
        child: ListTile(
          leading: Icon(
            Icons.email,
            color: Colors.black,
          ),
          title: TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(
                  fontFamily: 'Carme',
                )),
            keyboardType: TextInputType.emailAddress,
            validator: (String arg) {
              if (arg.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            // onChanged: (value) {
            //   email = value;
            // },
            onSaved: (value) => email = value,
          ),
        ));
  }

  Container buildRegister() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 50.0, right: 50.0),
      child: Text(
        'Join Us And Discover More',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 35.0,
          color: Colors.teal,
          fontFamily: 'Carme',
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
