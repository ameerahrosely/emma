import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(SignUpEmma());

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
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 60.0, right: 60.0),
                child: Text(
                  'Create A New Account',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.teal,
                    fontFamily: 'Carme',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
                width: 200.0,
                child: Divider(
                  color: Colors.teal,
                ),
              ),

              // CONTAINER 1: NAME
              Card(
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
                  ),
                )
              ),

              // CONTAINER 2: EMAIL
              Card(
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
                  ),
                )
              ),

              // CONTAINER 3: PASSWORD
              Card(
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
                  ),
                )
              ),

              // CONTAINER 4: RE-ENTER PASSWORD
              Card(
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
                  ),
                )
              ),

              SizedBox(
                height: 20.0,
              ),

              // REGISTER BUTTON
              SizedBox(
                width: 325.0,
                height: 50.0,
                child: RaisedButton(
                  color: Colors.teal,
                  onPressed: (){},
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

                
              FlatButton(
                  
                  onPressed: null,
                  child: Text('I am already a member', style: TextStyle(color: Colors.teal),),
                  )
                
              
              
            ],
          ),
        ),
      
      ),
      
    );
  }
}