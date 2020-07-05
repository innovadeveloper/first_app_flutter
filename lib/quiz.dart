import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz({@required this.questions, @required this.answerQuestion, @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    // create container to work with the position on the screen...
    return Column(
                children: [
                  Question(questions[questionIndex]['questionText']),
                  ...(questions[questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(
                      answerText: answer,
                      selectHandler: this.answerQuestion,
                    );
                  }).toList()
                ],
              );
  }
}
