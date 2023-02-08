// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treeunity/lernpfad/data_structure.dart';
import 'package:treeunity/lernpfad/quiz_page.dart';

class CheckpointWidget extends StatefulWidget {
  // const CheckpointWidget(
  //     {Key? key,
  //     required this.title,
  //     required this.id,
  //     required this.position,
  //     required this.quiz})
  //     : super(key: key);
  // final String title;
  // final int id;
  // final double position;

  // final Quiz quiz;
  final Checkpoint checkpoint;
  const CheckpointWidget({super.key, required this.checkpoint});

  @override
  State<CheckpointWidget> createState() => _CheckpointWidgetState();
}

class _CheckpointWidgetState extends State<CheckpointWidget> {
  late int numberOfQuestions;
  late int questionsAnswered;

  @override
  void initState() {
    numberOfQuestions = widget.checkpoint.quiz.length();
    questionsAnswered = widget.checkpoint.quiz.currentQuestionIndex();

    super.initState();
    widget.checkpoint.addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant CheckpointWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    numberOfQuestions = widget.checkpoint.quiz.length();
    questionsAnswered = widget.checkpoint.quiz.currentQuestionIndex();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(width: 50),
          Row(children: [
            Container(width: widget.checkpoint.position * 30),
            circleWithId(),
            Container(width: (1 - widget.checkpoint.position) * 30)
          ]),
          Container(
              margin: EdgeInsets.only(left: 10),
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.checkpoint.title,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.start,
                  ),
                  numberOfQuestions != 0
                      ? Text(
                          "${widget.checkpoint.quiz.completed() ? numberOfQuestions : questionsAnswered} von ${numberOfQuestions} Fragen beantwortet",
                          style: TextStyle(fontSize: 15),
                        )
                      : Container()
                ],
              ))
        ]),
        onTap: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuizPage(
                        title: widget.checkpoint.title,
                        quiz: widget.checkpoint.quiz,
                      )));
        });
  }

  Container circleWithId() {
    return Container(
      decoration: BoxDecoration(
          color: numberOfQuestions == questionsAnswered
              ? Colors.green
              : Colors.grey,
          shape: BoxShape.circle),
      height: 85,
      width: 60,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(22),
          child: Text(widget.checkpoint.id.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
