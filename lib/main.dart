import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('images/emma8.png'),
              ),
              
              SizedBox(
                height: 5.0,
                
              ),

              Container(
                margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
                child: Text(
                  'SIGN UP',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
                width: 250.0,
                child: Divider(
                  color: Colors.teal,
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                    ),
                  ),
                )
              ),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                    ),
                  ),
                )
              ),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                    ),
                  ),
                )
              ),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.black26,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Re-enter your password',
                    ),
                  ),
                )
              ),

              SizedBox(
                height: 30.0,
              ),

              RaisedButton(
                onPressed: (){},
                color: Colors.teal[400],
                materialTapTargetSize: MaterialTapTargetSize.padded,
                child: Text(
                  'Register', 
                  style: TextStyle(fontSize: 20.0, letterSpacing: 1.5, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      
      ),
      
    );
  }
}