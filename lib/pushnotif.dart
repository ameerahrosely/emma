// Main Programmer: MARINI MUSTAFA KAMAL (A17CS0086)

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  createAlertDialog(BuildContext context){
   return showDialog (
    context: context, 
    builder: (context)
    {
      return AlertDialog(
        title: Text('aye yoo'),
        content: Text('what is up boiii'),
        actions: <Widget>[
          MaterialButton(
            elevation: 0.5,
            child: Text('nun', style:TextStyle(color: Colors.red),), //this is close the alertdialog and do nothing
            onPressed:() => Navigator.of(context).pop(context),
          ),
          MaterialButton(
            elevation: 0.5,
            child: Text('juz working\'', style:TextStyle(color: Colors.teal),), //this should navigate to the next page or something
            onPressed:() {},
          ),
        ],
      );
    },
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'press the button down there',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {createAlertDialog(context);},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}