import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText': "What's your favourite color?",
      'answers': [
        {'text': 'Orange', 'score': 5},
        {'text': 'Purple', 'score': 1},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 2}
      ],
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': [
        {'text': 'Lion', 'score': 5},
        {'text': 'Peacock', 'score': 2},
        {'text': 'Tiger', 'score': 4},
        {'text': 'Rabbit', 'score': 1}
      ],
    },
    {
      'questionText': "What's your favourite Laptop?",
      'answers': [
        {'text': 'Apple', 'score': 1},
        {'text': 'HP', 'score': 1},
        {'text': 'Dell', 'score': 2},
        {'text': 'Microsoft', 'score': 3}
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
