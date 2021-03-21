import 'package:flutter/material.dart';
import 'package:flutter_assignment/TextControl.dart';
import 'package:flutter_assignment/TextWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _textIndex = 0;

  List _textList = ['Texter 1', 'Texter 2', 'Text 3', 'Text 4', 'Text 5'];

  void _nextText() {
    setState(() {
      _textIndex += 1;
    });

    print('Text index  ' + _textIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(_textList[_textIndex]),
              TextControl(_nextText),
            ],
          ),
        ),
      ),
    );
  }
}
