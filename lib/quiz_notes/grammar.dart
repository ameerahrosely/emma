import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GrammarOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              title(),
              Positioned(left: 30, top: 200, child: pinkyBox()),
              Positioned(left: 80, top: -10, child: addImageHere()),
              //Positioned(left: 80, top: 300, child: meaningText()),
              Positioned(left: 50, top: 260, child: meaningContent()),
              Positioned(left: 50, top: 570, child: exampleText()),
              Positioned(left: 50, top: 600, child: exampleContent()),
              Positioned(
                left: 20,
                top: 670,
                child: FloatingActionButton(
                  child: Icon(Icons.arrow_back_ios),
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

  Container addImageHere() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
      width: 310.0,
      height: 310.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image(
          image: AssetImage('images/school-bag.png'),
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

  Container meaningContent() {
    return Container(
      width: 330,
      child: Text(
        'Grammar is a structure of how a language should be written or spoken in. It is like the rules and regulations of a language.\n\nIn this note, we will cover three parts\n- singular & plural nouns\n- simple tenses\n- articles\n\nUsually the difference between singular and plural nouns are the presence of \'s\' or \'ies\' in plural nouns.',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Container exampleContent() {
    return Container(
      width: 350,
      child: Text(
        '- book, books\n- ox, oxen (different spelling thus it requires extra reading and memorizing',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Container pinkyBox() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      width: 370,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.yellow[300],
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Container title() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: TypewriterAnimatedTextKit(
        text: ['Grammar'],
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
