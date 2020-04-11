// Main Programmer: AZRI AMIRAH (A17CS0024)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'userprofile.dart';
import 'main.dart';

void main() => runApp(LoginEmma());

class LoginEmma extends StatelessWidget {
  
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

              // Container for LOG IN text
              buildContainerText(),

              SizedBox(
                height: 30.0,
                width: 200.0,
                child: Divider(
                  color: Colors.teal,
                ),
              ),

              // CONTAINER 1: EMAIL
              buildEnterEmail(),

              // CONTAINER 2: PASSWORD
              buildEnterPassword(),

              SizedBox(
                height: 20.0,
              ),

              // REMEMBER ME SWITCH BUTTON
              buildSwitchButton(),

              SizedBox(
                height: 20.0,
              ),

              // LOG IN BUTTON
              // ONPRESSED: MAIN PAGE/USER PROFILE
              SizedBox(
                width: 320.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.teal,
                  onPressed:  () async {
                // showDefaultSnackbar(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UserProfile();
                 }));
              },
                  child: Text(
                    'Log In',
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

              // BUTTON TO NAVIGATE TO REGISTER PAGE
              // ONPRESSED: SIGN UP PAGE
              FlatButton(
                onPressed: () async {
                // showDefaultSnackbar(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpEmma();
                }));
              },
                child: Text('I don\'t have an account', style: TextStyle(color: Colors.teal),),
              ),

            ],
          )
        ),
      ),
    );
  }

  Container buildSwitchButton() {
    return Container(
              margin: EdgeInsets.only(left: 33.0, right: 30.0),
              
                child: ListTile(
                  title: Text('Remember Me'),
                  trailing: CupertinoSwitch(
                    activeColor: Colors.teal[300],
                    value: true, 
                    onChanged: (bool newvalue){
                      newvalue = false;
                    }),
                )
              
            );
  }

  Card buildEnterPassword() {
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
                    ),
                  ),

                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter your password!';
                    }
                    return null;
                  },
                ),
              )
            );
  }

  Card buildEnterEmail() {
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
                    ),
                  ),

                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter your email!';
                    }
                    return null;
                  },
                ),
              )
            );
  }

  Container buildContainerText() {
    return Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 50.0, right: 50.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome Back!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 45.0,
                  color: Colors.teal,
                  fontFamily: 'Carme',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              )
            );
  }
}

