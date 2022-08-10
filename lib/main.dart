import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          'Black',
          'Red',
          'Green',
          'White',
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          'Rabbit',
          'Snake',
          'Cat',
          'Lion',
        ]
      },
      {
        'questionText': 'What\'s your favorite Programming language?',
        'answers': [
          'Dart',
          'Rust',
          'Java',
          'Python',
        ]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Column(
          children: [
            Question(
              (questions[questionIndex]['questionText'] as String),
            ),
            ...(questions[questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
