import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final Function nextText;

  const TextControl(this.nextText);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => nextText(),
      child: Text('Next'),
    );
  }
}
