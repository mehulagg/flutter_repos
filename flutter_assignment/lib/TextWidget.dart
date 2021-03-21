import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String textList;

  const TextWidget( this.textList);
  @override
  Widget build(BuildContext context) {
    return Text(textList);
  }
}
