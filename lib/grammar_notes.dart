// MAIN PROGRAMMER: AZRI AMIRAH BINTI MOHD YANI (A17CS0024)

import 'package:emma/main_notes.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class GrammarOne extends StatefulWidget {
  @override
  _GrammarOneState createState() => _GrammarOneState();
}

class _GrammarOneState extends State<GrammarOne> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        'grammar': (context) => GrammarOne(),
        'notesnavi': (context) => NotesMain(),
      },
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('GRAMMAR'),
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
              stream: _firestore.collection('notes-grammar').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ));
                }

                final gnotes = snapshot.data.documents;
                final name = gnotes[notesNo]['rule'];
                final explain = gnotes[notesNo]['explanation'];
                final explain2 = gnotes[notesNo]['explanation2'];
                final ex1 = gnotes[notesNo]['example']['e1'];
                final ex2 = gnotes[notesNo]['example']['e2'];
                final ex3 = gnotes[notesNo]['example']['e3'];
                final ex4 = gnotes[notesNo]['example']['e4'];

                return Stack(
                  children: <Widget>[
                    title(name),
                    Positioned(left: 30, top: 200, child: pinkyBox()),
                    Positioned(left: 155, top: 25, child: addImageHere()),
                    Positioned(
                        left: 50, top: 270, child: meaningContent(explain)),
                    Positioned(
                        left: 50,
                        top: 400,
                        child: exampleContent(explain2, ex1, ex2, ex3, ex4)),
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
                                      builder: (context) => GrammarOne()));
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
                                      builder: (context) => GrammarOne()));
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
          image: AssetImage('images/school-bag.png'),
        ),
      ),
    );
  }

  Container meaningContent(String k) {
    return Container(
      width: 330,
      child: Text(
        k,
        style: TextStyle(
          fontSize: 15,
          wordSpacing: 2,
        ),
      ),
    );
  }

  Container exampleContent(String a, String b, String c, String m, String n) {
    return Container(
        width: 330,
        child: Text(
          '$a \n\nFor example: \n- $b\n- $c\n- $m\n- $n',
          style: TextStyle(
            fontSize: 15,
            wordSpacing: 2,
          ),
        )
        //

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
