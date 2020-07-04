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

  var questions = [
    'What\'s your favorite color?',
    'What\'s your favorite animal?',
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
            Text(questions[questionIndex]),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
              // onPressed: () => {
              //   print("answer 1"),
              // },
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
