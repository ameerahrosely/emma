// Main Programmer: AZRI AMIRAH (A17CS0024)

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';

import 'login.dart';


void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new StartScreen(),
  ));
}

class StartScreen extends StatefulWidget{
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<StartScreen>{
  @override 
  Widget build (BuildContext context){
    return SplashScreen(
      seconds: 7, 
      backgroundColor: Colors.black,
      image: Image.asset('images/loading4.gif', alignment: Alignment.bottomCenter,),
      loaderColor: Colors.transparent,
      loadingText: Text('EMMA welcomes you onboard...', style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),),
      photoSize: 220.0,
      navigateAfterSeconds: SignUpEmma(),
      );
  }
}

class SignUpEmma extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        backgroundColor: Colors.white,
        
        body: SafeArea(
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

              // INPUT FIELD 1: NAME
              buildInputName(),

              // INPUT FIELD 2: EMAIL
              buildInputEmail(),

              // INPUT FIELD 3: PASSWORD
              buildInputPassword(),

              // INPUT FIELD 4: RE-ENTER PASSWORD
              buildReEnterPassword(),

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
                  onPressed: () async {
                  // showDefaultSnackbar(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return LoginEmma();
                    }));
                    final snackBar = SnackBar(
                    content: Text('You have succesfully been registered'),
                    action: SnackBarAction(
                      label: '',
                        onPressed: () {
                        // Some code to undo the change.
                        },
                      )
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
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
                // showDefaultSnackbar(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginEmma();
                }));
              },
                child: Text('I am a member of EMMA', style: TextStyle(color: Colors.teal),),
              )
                
            ],
          ),
        ),
      
      ),
      
    );
  }

  Card buildReEnterPassword() {
    return Card(
              margin: EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.black26,
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Re-enter your password',
                    hintStyle: TextStyle(
                      fontFamily: 'Carme',
                    )
                  ),
                  keyboardType: TextInputType.visiblePassword,

                  validator: (String arg){
                    if (arg.isEmpty) {
                      return 'Please enter your password again';
                    }
                    return null;
                  },
                  onSaved: (String val){
                  },
                ),
              )
            );
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
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      fontFamily: 'Carme',
                    )
                  ),
                  keyboardType: TextInputType.visiblePassword,

                  validator: (String arg){
                    if (arg.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (String val){
                  },
                ),
              )
            );
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
                    )
                  ),
                  keyboardType: TextInputType.emailAddress,

                  validator: (String arg){
                    if (arg.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (String val){
                  },
                ),
              )
            );
  }

  Card buildInputName() {
    return Card(
              margin: EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      fontFamily: 'Carme',
                    )
                  ),
                  keyboardType: TextInputType.text,

                  validator: (String arg){
                    if (arg.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (String val){
                  },
                ),
              )
            );
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