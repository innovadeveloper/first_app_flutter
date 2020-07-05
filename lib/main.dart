// import 'package:first_app/answer.dart';
// import 'package:first_app/question.dart';
import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// shorcut : shift + option + F

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class AnswerEntity {
  String text;
  int score;

  AnswerEntity.fromJson(Map json){
    this.text = json["text"];
    this.score = json ["score"];
  }
}

class QuestionAndAnswer {
  String questionText;
  List<AnswerEntity> answers;

  QuestionAndAnswer.fromJson(Map json){
    this.questionText = json["questionText"];
    this.answers = [];
    for (var i = 0; i < (json['answers'] as List<Map<String, Object>>).length; i++) {
      this.answers.add(AnswerEntity.fromJson(json['answers'][i]));
    }
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  var _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {
          'text': 'Black',
          'score': 2,
        },
        {
          'text': 'Red',
          'score': 3,
        },
        {
          'text': 'Green',
          'score': 4,
        },
        {
          'text': 'White',
          'score': 5,
        },
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 3,
        },
        {
          'text': 'Snake',
          'score': 2,
        },
        {
          'text': 'Elephant',
          'score': 1,
        },
        {
          'text': 'Lion',
          'score': 4,
        },
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {
          'text': 'Ines',
          'score': 5,
        },
        {
          'text': 'Fortunato',
          'score': 7,
        },
        {
          'text': 'Lesly',
          'score': 9,
        },
        {
          'text': 'Kane',
          'score': 4,
        },
      ]
    }
  ];

  List<QuestionAndAnswer> get answersAndQuestions{
    List<QuestionAndAnswer> answersAndQuestions = [];
    for (var i = 0; i < _questions.length; i++) {
      answersAndQuestions.add(QuestionAndAnswer.fromJson(_questions[i]));
    }
    return answersAndQuestions;
  }

  void parsingJson(){
    List<QuestionAndAnswer> answersAndQuestions = [];
    for (var i = 0; i < _questions.length; i++) {
      answersAndQuestions.add(QuestionAndAnswer.fromJson(_questions[i]));
    }
    print("=============================");
    for (var i = 0; i < answersAndQuestions.length; i++) {
      print(answersAndQuestions[i].questionText);
      // print(answersAndQuestions[i].answers);
      for (var j in answersAndQuestions[i].answers) {
        print("The text is ${j.text} and score is ${j.score}"); 

      }
    }
    // print(answersAndQuestions);
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    // parsingJson();
  }

  void _resetQuiz(){
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App in Flutter'),
        ),
        body: _questionIndex < answersAndQuestions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: answersAndQuestions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
