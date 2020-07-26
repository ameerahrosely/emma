import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class IdiomOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              title(),
              Positioned(left: 50, top: 200, child: pinkyBox()),
              Positioned(left: 80, top: -10, child: addImageHere()),
              Positioned(left: 80, top: 300, child: meaningText()),
              Positioned(left: 80, top: 330, child: meaningContent()),
              Positioned(left: 80, top: 500, child: exampleText()),
              Positioned(left: 80, top: 530, child: exampleContent()),
              Positioned(
                left: 20,
                top: 670,
                child: FloatingActionButton(
                  child: Icon(Icons.arrow_back_ios),
                  backgroundColor: Colors.purple,
                  onPressed: null, //pergi back page
                ),
              ),
              Positioned(
                left: 340,
                top: 670,
                child: FloatingActionButton(
                  child: Icon(Icons.arrow_forward_ios),
                  backgroundColor: Colors.yellow[800],
                  onPressed: null,
                ),
              ),
            ],
            overflow: Overflow.visible,
          ),
        ),
      ),
    );
  }

  Container meaningText() {
    return Container(
      child: Text(
        'Meaning',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          fontSize: 20,
        ),
      ),
    );
  }

  Container exampleText() {
    return Container(
      child: Text(
        'Example',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          fontSize: 20,
        ),
      ),
    );
  }

  Container addImageHere() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
      width: 310.0,
      height: 310.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image(
          image: AssetImage('images/flame-training.png'),
        ),
      ),
    );
  }

  Container pinkyBox() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      width: 330,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Container meaningContent() {
    return Container(
      width: 250,
      child: Text(
        'Example Example Example Example Example Example Example Example Example Example',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Container exampleContent() {
    return Container(
      width: 250,
      child: Text(
        'Example Example Example Example Example Example Example Example Example Example',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Container title() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: TypewriterAnimatedTextKit(
        text: ['Idiom'],
        speed: Duration(seconds: 1),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
