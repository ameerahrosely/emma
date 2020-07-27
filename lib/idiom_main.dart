// MAIN PROGRAMMER: AZRI AMIRAH BINTI MOHD YANI (A17CS0024)

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'quizmain.dart';

final _firestore = Firestore.instance;
var idiomquestionNo = 0;
var idiomfinalScore = 0;
var semifinalI = 0;
var finalresultI = 0;

void main() => runApp(StartQuiz());

class IdiomQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          'quizmain': (context) => StartQuiz(),
        },
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.teal[400],
              title: Text(
                'IDIOM',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              elevation: 0,
              leading: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        settings: RouteSettings(name: '/quizmain'),
                        builder: (context) => StartQuiz()),
                  );
                  Navigator.of(context)
                      .popUntil(ModalRoute.withName('/quizmain'));
                },
              ),
            ),
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ))));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('idioms').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ));
        } else {
          final messages = snapshot.data.documents;

          final c1 = messages[idiomquestionNo]['choices']['opt1'];
          final c2 = messages[idiomquestionNo]['choices']['opt2'];
          final c3 = messages[idiomquestionNo]['choices']['opt3'];

          bool isPressed = false;

          Color colornormal = Colors.teal;
          Color correct = Colors.green;
          Color incorrect = Colors.red;

          Map<String, Color> btnColor = {
            'choice1': Colors.pink[300],
            'choice2': Colors.blue,
            'choice3': Colors.indigo[300],
          };

          void checkAnswer(int qn, int choice) {
            setState(() {
              if (messages[qn]['choices']['opt$choice'] ==
                  messages[qn]['answer']) {
                idiomfinalScore++;
                print('Correct');
                colornormal = correct;
              } else {
                print('Incorrect');
                colornormal = incorrect;
              }
            });
          }

          void updateQuestion() {
            setState(() {
              if (idiomquestionNo == messages.length - 1) {
                print(idiomfinalScore);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Summary(score: idiomfinalScore)));
              } else {
                isPressed = false;
                idiomquestionNo++;
              }
            });
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // IMAGE
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Image.asset(
                      messages[idiomquestionNo]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // QUESTION
              Expanded(
                  child: Center(
                child: Text(
                  messages[idiomquestionNo]['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                  ),
                ),
              )),

              // CHOICE 1
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: !isPressed ? btnColor['choice1'] : colornormal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      c1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      isPressed = true;
                      checkAnswer(idiomquestionNo, 1);
                      new Timer(Duration(seconds: 1), () {
                        updateQuestion();
                      });
                      setState(() {
                        btnColor['choice1'] = colornormal;
                      });
                    },
                  ),
                ),
              ),

              // CHOICE 2
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: !isPressed ? btnColor['choice2'] : colornormal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      c2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      isPressed = true;
                      checkAnswer(idiomquestionNo, 2);
                      new Timer(Duration(seconds: 1), () {
                        updateQuestion();
                      });
                      setState(() {
                        btnColor['choice2'] = colornormal;
                      });
                    },
                  ),
                ),
              ),

              // CHOICE 3
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FlatButton(
                    textColor: Colors.white,
                    color: !isPressed ? btnColor['choice3'] : colornormal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      c3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    onPressed: () {
                      isPressed = true;
                      checkAnswer(idiomquestionNo, 3);
                      new Timer(Duration(seconds: 1), () {
                        updateQuestion();
                      });
                      setState(() {
                        btnColor['choice3'] = colornormal;
                      });
                    },
                  ),
                ),
              ),

              // SCORE INDICATOR
              Expanded(
                  child: Center(
                child: SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: RaisedButton(
                    elevation: 2,
                    color: Colors.teal[50],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.teal,
                          width: 3,
                        )),
                    child: Text(
                      'Score: $idiomfinalScore/${messages.length}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              )),
            ],
          );
        }
      },
    );
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('idioms').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          );
        } else {
          final messages = snapshot.data.documents;
          final int fullscore = messages.length;
          finalresultI = ((score / fullscore) * 100).round();
          semifinalI = score ~/ idiomfinalScore;

          return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("images/source.gif"),
                fit: BoxFit.cover,
              )),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      height: 100.0,
                      width: 250.0,
                      child: Text(
                        'Congratulations! Your score is $finalresultI%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                      width: 200.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.teal[100],
                        child: Text(
                          'End Quiz',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, 'quizmain');
                        },
                      )),
                ],
              ),
            )),
          );
        }
      },
    );
  }
}
