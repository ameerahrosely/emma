import 'package:emma/vocab_notes.dart';

import 'grammar_notes.dart';
import 'idiom_main.dart';
import 'grammar_main.dart';
import 'idiom_notes.dart';
import 'main_notes.dart';
import 'vocab_main.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class StartQuiz extends StatefulWidget {
  @override
  _StartQuizState createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
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
            backgroundColor: Colors.teal,
            title: Text(
              'QUIZ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            elevation: 0,
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      settings: RouteSettings(name: '/notesnavi'),
                      builder: (context) => NotesMain()),
                );
                Navigator.of(context)
                    .popUntil(ModalRoute.withName('/notesnavi'));
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: 415.0,
                  height: 275.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/quiztime.png'),
                    fit: BoxFit.cover,
                  )),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 230.0, 0, 5.0),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30.0,
                  width: 25.0,
                ),

                // QUIZ 1: GRAMMAR
                StreamBuilder(
                    stream: _firestore.collection('achievements').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ));
                      }

                      _firestore
                          .collection('achievements')
                          .document('2eEXROeEBq0UINhE03Bh')
                          .updateData({
                        'grammar': finalresultG,
                      });

                      return Card(
                          color: Colors.teal[200],
                          elevation: 7,
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 9.0),
                            leading: Image.asset(
                              'images/letter_g.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                            title: Text('Grammar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: Text(
                                'Take this grammar quiz to see if you have grasped the concept!',
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                            trailing: CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 3,
                              progressColor: Colors.white,
                              percent: (semifinalG.toDouble()),
                              center: Text((finalresultG).round().toString(),
                                  style: TextStyle(fontSize: 15)),
                            ),
                            onTap: () {
                              setState(() {
                                resetQuiz();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GrammarQuiz()));
                              });
                            },
                          ));
                    }),

                SizedBox(
                  height: 30.0,
                  width: 250.0,
                ),

                // QUIZ 2: IDIOM
                StreamBuilder(
                    stream: _firestore.collection('achievements').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ));
                      }

                      _firestore
                          .collection('achievements')
                          .document('2eEXROeEBq0UINhE03Bh')
                          .updateData({
                        'idiom': finalresultI,
                      });

                      return Card(
                          color: Colors.teal[200],
                          elevation: 7,
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 9.0),
                            leading: Image.asset(
                              'images/letter_i.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                            title: Text('Idiom',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: Text(
                                'See if you can guess what these idioms mean!',
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                            trailing: CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 3,
                              progressColor: Colors.white,
                              percent: (semifinalI.toDouble()),
                              center: Text((finalresultI).round().toString(),
                                  style: TextStyle(fontSize: 15)),
                            ),
                            onTap: () {
                              setState(() {
                                resetQuiz();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IdiomQuiz()));
                              });
                            },
                          ));
                    }),

                SizedBox(
                  height: 30.0,
                  width: 250.0,
                ),

                // QUIZ 3: VOCABULARY
                StreamBuilder(
                    stream: _firestore.collection('achievements').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ));
                      }

                      _firestore
                          .collection('achievements')
                          .document('2eEXROeEBq0UINhE03Bh')
                          .updateData({
                        'vocabulary': finalresultV,
                      });

                      return Card(
                          color: Colors.teal[200],
                          elevation: 7,
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 5.0),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 9.0),
                            leading: Image.asset(
                              'images/letter_v.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                            title: Text('Vocabulary',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            subtitle: Text(
                              'Confirm your vocabulary skills by taking this quiz!',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            trailing: CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 3,
                              progressColor: Colors.black,
                              percent: (semifinalV.toDouble()),
                              center: Text((finalresultV).round().toString(),
                                  style: TextStyle(fontSize: 15)),
                            ),
                            onTap: () {
                              setState(() {
                                resetQuiz();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VocabQuiz()));
                              });
                            },
                          ));
                    }),
              ],
            ),
          ),
        ));
  }

  void startQuiz() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IdiomQuiz()));
    });
  }
}

void resetQuiz() {
  idiomquestionNo = 0;
  idiomfinalScore = 0;

  questionNoV = 0;
  finalresultV = 0;

  grammarquestionNo = 0;
  finalresultG = 0;
}
