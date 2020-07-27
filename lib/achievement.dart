//Main Programmer: Ameerah Nabihah binti Rosely
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Achievement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.teal,
          ),
        ),
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 150, 0),
                      child: Text(
                        'Achievement',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0, left: 40),
                      color: Colors.white,
                      width: 310.0,
                      height: 310.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image(
                          image: AssetImage('images/ach.png'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 30),
                      height: 30.0,
                      width: 350.0,
                      child: Divider(
                        color: Colors.teal[200],
                        thickness: 10,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 40),
                      child: Text(
                        'Your current level is',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Carme',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 30.0),
                            color: Colors.teal[50],
                            width: 100.0,
                            height: 100.0,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image(
                                image: AssetImage('images/prize.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 250.0,
                            height: 100,
                            child: TextLiquidFill(
                              text: 'Beginner',
                              waveDuration: Duration(seconds: 2),
                              waveColor: Colors.yellow[800],
                              boxBackgroundColor: Colors.teal,
                              textStyle: TextStyle(
                                fontSize: 50.0,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.bold,
                              ),
                              boxHeight: 100.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
