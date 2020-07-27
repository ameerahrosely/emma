// MAIN PROGRAMMER: AZRI AMIRAH BINTI MOHD YANI (A17CS0024)

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main_notes.dart';

final _firestore = Firestore.instance;

class VocabOne extends StatefulWidget {
  @override
  _VocabOneState createState() => _VocabOneState();
}

class _VocabOneState extends State<VocabOne> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        'notesnavi': (context) => NotesMain(),
      },
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('VOCABULARY'),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    settings: RouteSettings(name: '/notesnavi'),
                    builder: (context) => NotesMain()),
              );
              Navigator.of(context).popUntil(ModalRoute.withName('/notesnavi'));
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: StreamBuilder(
              stream: _firestore.collection('notes-vocab').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ));
                }

                final gnotes = snapshot.data.documents;
                final theword = gnotes[notesNo]['word'];
                final themeaning = gnotes[notesNo]['meaning'];
                final ex = gnotes[notesNo]['example'];

                return Stack(
                  children: <Widget>[
                    title(theword),
                    Positioned(left: 30, top: 200, child: pinkyBox()),
                    Positioned(left: 155, top: 25, child: addImageHere()),
                    Positioned(
                        left: 50, top: 270, child: meaningContent(theword)),
                    Positioned(
                        left: 50,
                        top: 320,
                        child: exampleContent(themeaning, ex)),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: FloatingActionButton(
                          heroTag: null,
                          child: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            if (notesNo != 0) {
                              notesNo--;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VocabOne()));
                            }
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: FloatingActionButton(
                          heroTag: null,
                          child: Icon(Icons.arrow_forward_ios),
                          backgroundColor: Colors.yellow[800],
                          onPressed: () {
                            if (notesNo == gnotes.length - 1) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    settings: RouteSettings(name: '/notesnavi'),
                                    builder: (context) => NotesMain()),
                              );
                              Navigator.of(context)
                                  .popUntil(ModalRoute.withName('/notesnavi'));
                            } else {
                              notesNo++;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VocabOne()));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                  overflow: Overflow.visible,
                );
              }),
        ),
      ),
    );
  }

  Container addImageHere() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
      width: 250.0,
      height: 250.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image(
          image: AssetImage('images/ach.png'),
        ),
      ),
    );
  }

  Container meaningContent(String k) {
    return Container(
      width: 330,
      child: Text(
        k.toUpperCase(),
        style: TextStyle(
          fontSize: 30,
          wordSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container exampleContent(String a, String b) {
    return Container(
      width: 330,
      child: Text(
        'It means: $a \n\nExample: \n- $b',
        style: TextStyle(
          fontSize: 20,
          wordSpacing: 2,
        ),
      ),
    );
  }

  Container pinkyBox() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: 355,
      height: 500,
      decoration: BoxDecoration(
        color: Colors.yellow[300],
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Container title(String h) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
      child: TypewriterAnimatedTextKit(
        text: [h],
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
