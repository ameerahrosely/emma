// MAIN PROGRAMMER: AZRI AMIRAH BINTI MOHD YANI (A17CS0024)

import 'package:emma/grammar_notes.dart';
import 'package:flutter/material.dart';
import 'idiom_notes.dart';
import 'vocab_notes.dart';

var notesNo = 0;

class NotesMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          'grammar': (context) => GrammarOne(),
          'idiom': (context) => IdiomOne(),
          'vocab': (context) => VocabOne(),
        },
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.teal[400],
              title: Text(
                'NOTES',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              elevation: 0,
              leading: BackButton(),
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: NotesPage(),
            ))));
  }
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // ACCESS TO GRAMMAR NOTES
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.pink[50],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.teal,
                    width: 3,
                  )),
              child: Text(
                'Grammar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              onPressed: () {
                resetNotes();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GrammarOne(),
                      settings: RouteSettings(arguments: notesNo),
                    ));
              },
            ),
          ),
        ),

        // ACCESS TO IDIOM NOTES
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.teal,
                    width: 3,
                  )),
              child: Text(
                'Idiom',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              onPressed: () {
                resetNotes();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IdiomOne(),
                      settings: RouteSettings(arguments: notesNo),
                    ));
              },
            ),
          ),
        ),

        // ACCESS TO VOCABULARY NOTES
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.indigo[50],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.teal,
                    width: 3,
                  )),
              child: Text(
                'Vocabulary',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
              onPressed: () {
                resetNotes();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VocabOne(),
                      settings: RouteSettings(arguments: notesNo),
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }

  void resetNotes() {
    notesNo = 0;
  }
}
