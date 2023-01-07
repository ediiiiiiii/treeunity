import 'package:flutter/material.dart';

class Question {
  Question(
      {required this.question,
      required this.responds,
      required this.answer,
      this.child});
  String question;
  List<String> responds;
  int answer;
  Widget? child;
}

class Quiz {
  Quiz({required this.questions, this.anweredQuestions = 0});
  List<Question> questions;
  int anweredQuestions = 0;

  int length() {
    return questions.length;
  }

  double completed() {
    return anweredQuestions / length();
  }
}
