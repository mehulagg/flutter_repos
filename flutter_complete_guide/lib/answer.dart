import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
          foregroundColor: MaterialStateProperty.all(Colors.amber),
          shadowColor: MaterialStateProperty.all(Colors.amber[400]),
        ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
