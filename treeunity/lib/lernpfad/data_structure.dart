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
  Quiz({required this.questions});

  final List<Function> _listeners = [];
  List<Question> questions;
  int _answeredQuestions = 0;
  bool _completed = false;

  void addListerner(Function f) {
    _listeners.add(f);
  }

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
    for (Function f in _listeners) {
      f();
    }
    if (_answeredQuestions != (length() - 1)) {
      _answeredQuestions += 1;
      _completed = false;
    } else {
      _completed = true;
    }
    return _answeredQuestions;
  }

  int currentQuestionIndex() {
    return _answeredQuestions;
  }
}

class Info {
  Info({this.title = "", this.content});
  String title;
  Widget? content;

  bool _read = false;

  bool completed() {
    return _read;
  }
}

class Checkpoint {
  dynamic content;
  String title;
  double position;
  int id;

  void addListener(Function f) {
    content.addListerner(f);
  }

  Checkpoint(
      {required this.content,
      required this.title,
      required this.position,
      required this.id});
}

class Lernpfad {
  List<Checkpoint> checkpoints;
  Lernpfad({required this.checkpoints});

  void addListener(Function f) {
    for (Checkpoint c in checkpoints) {
      c.addListener(f);
    }
  }

  List<double> getPositions() {
    List<double> offsets = [];
    for (var i = 0; i < checkpoints.length; i++) {
      offsets.add(checkpoints[i].position);
    }
    return offsets;
  }

  double progress() {
    int progress = 0;
    int count = 0;
    for (var c in checkpoints) {
      if (c.content.runtimeType == Quiz) {
        progress += c.content.currentQuestionIndex() as int;
        count += c.content.length() as int;
      }
    }
    print(progress);
    print(count);
    return progress / count;
  }
}
