import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandler;

  Answer({this.answerText, this.selectHandler});

  @override
  Widget build(BuildContext context) {
    // create container to work with the position on the screen...
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(this.answerText),
        onPressed: this.selectHandler,
      ),
    );
    // return Text(this.questionText);
  }
}
