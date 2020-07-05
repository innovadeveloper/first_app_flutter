import 'package:first_app/answer.dart';
import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// shorcut : shift + option + F

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  
  var questionIndex = 0;

  // var questions = [
  //   'What\'s your favorite color?',
  //   'What\'s your favorite animal?',
  // ];
  var questions = [
    {
      'questionText' : 'What\'s your favorite color?',
      'answers' : ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText' : 'What\'s your favorite animal?',
      'answers' : ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText' : 'Who\'s your favorite instructor?',
      'answers' : ['Ines', 'Fortunato', 'Lesly', 'Kane']
    }
  ];

  void answerQuestion() {
    setState(() {
      questionIndex += 1;
      if(questionIndex >= questions.length){
        questionIndex = 0;
      }
    });

    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App in Flutter'),
        ),
        body: Column(
          children: [
            Question(questions[questionIndex]['questionText']),
            ...(questions[questionIndex]['answers'] as List<String>).map((answer){
              return Answer(answerText: answer, selectHandler: this.answerQuestion,);
            }).toList()

            // // Answer(answerText: ,)
            // RaisedButton(
            //   child: Text('Answer 1'),
            //   onPressed: answerQuestion,
            //   // onPressed: () => {
            //   //   print("answer 1"),
            //   // },
            // ),
            // RaisedButton(
            //   child: Text('Answer 2'),
            //   onPressed: answerQuestion,
            // ),
            // RaisedButton(
            //   child: Text('Answer 3'),
            //   onPressed: answerQuestion,
            // ),
          ],
        ),
      ),
    );
  }
}
