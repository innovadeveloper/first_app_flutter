import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function selectHandler;

  Result(this.resultScore, this.selectHandler);

  String get resultPhrase {
    var resultText = '';
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // create container to work with the position on the screen...
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      // color: Colors.pink,
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text("Reset quiz"),
              onPressed: this.selectHandler,
              textColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
    // return Text(this.questionText);
  }
}
