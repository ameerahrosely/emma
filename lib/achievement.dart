import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Achievement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'Achievement',
            style: TextStyle(
              color: Colors.white,
              wordSpacing: 0,
            ),
          ),
          elevation: 0,
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40.0),
                        color: Colors.teal[50],
                        width: 310.0,
                        height: 310.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image(
                            image: AssetImage('images/prize.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        // Inserting Divider
                        height: 30.0,
                        width: 310.0,
                        child: Divider(
                          color: Colors.teal[200],
                          thickness: 10,
                        ),
                      ),
                      Text(
                        'Your current level is',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Source Sans Pro',
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        width: 310.0,
                        height: 150,
                        child: TextLiquidFill(
                          text: 'Intermediate',
                          waveDuration: Duration(seconds: 1),
                          waveColor: Colors.yellow[800],
                          boxBackgroundColor: Colors.teal,
                          textStyle: TextStyle(
                            fontSize: 50.0,
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold,
                          ),
                          boxHeight: 300.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
