import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // create container to work with the position on the screen...
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        this.questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
    // return Text(this.questionText);
  }
}
