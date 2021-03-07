import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "What's your favourite color?",
      "What's your favourite animal?",
    ];
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]),
            ElevatedButton(
              onPressed: () => _answerQuestion(),
              child: Text('Answer1'),
            ),
            ElevatedButton(
              onPressed: () => _answerQuestion(),
              child: Text('Answer2'),
            ),
            ElevatedButton(
              onPressed: () => _answerQuestion(),
              child: Text('Answer3'),
            ),
          ],
        ),
      ),
    );
  }
}
