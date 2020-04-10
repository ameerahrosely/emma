import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        
        body: SafeArea(
          child: Column(

            //mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              
              Image.asset('images/emma3.png', width: 200.0, height: 200.0,),
              
              SizedBox(
                height: 30.0,
              ),

              Container(
             
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 30.0,
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
                    color: Colors.black54,
                  ),
                  title: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Re-enter your password',
                    ),
                  ),
                )
              ),

            ],
          ),
        ),
      
      ),
      
    );
  }
}