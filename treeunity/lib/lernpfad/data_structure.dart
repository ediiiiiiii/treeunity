import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  Quiz({required this.questions});
  List<Question> questions;
  int _answeredQuestions = 0;
  bool _completed = false;

  int length() {
    int length = questions.length;
    if (length > 0) {
      return length;
    } else {
      return -1;
    }
  }

  bool completed() {
    return _completed;
  }

  double progress() {
    return completed() ? 1.0 : _answeredQuestions / length();
  }

  Question currentQuestion() {
    return questions[_answeredQuestions];
  }

  int nextQuestion() {
    if (_answeredQuestions != (length() - 1)) {
      _answeredQuestions += 1;
      _completed = false;
      print("new question");
    } else {
      _completed = true;
      print("questions done");
    }
    return _answeredQuestions;
  }

  int currentQuestionIndex() {
    return _answeredQuestions;
  }
}

class Lernpfad {
  List<Quiz> quizes;
  Lernpfad({required this.quizes});
}
