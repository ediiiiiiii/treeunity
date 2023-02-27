// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treeunity/lernpfad/data_structure.dart';
import 'package:treeunity/lernpfad/info.dart';
import 'package:treeunity/lernpfad/quiz.dart';

class CheckpointWidget extends StatefulWidget {
  final Checkpoint checkpoint;
  final Function onClosed;
  const CheckpointWidget(
      {super.key, required this.checkpoint, required this.onClosed});

  @override
  State<CheckpointWidget> createState() => _CheckpointWidgetState();
}

class _CheckpointWidgetState extends State<CheckpointWidget> {
  late int nQuestions = -1;
  late int qAnswered = -1;

  void update() {
    if (widget.checkpoint.content.runtimeType == Quiz) {
      nQuestions = widget.checkpoint.content.length();
      qAnswered = widget.checkpoint.content.currentQuestionIndex();
    }
  }

  Widget getWidget() {
    if (widget.checkpoint.content.runtimeType == Quiz) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(width: 50),
        Row(children: [
          Container(width: widget.checkpoint.position * 30),
          circleWithId(),
          Container(width: (1 - widget.checkpoint.position) * 30)
        ]),
        Container(
            margin: EdgeInsets.only(left: 10),
            //width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.checkpoint.title,
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
                nQuestions != 0
                    ? Text(
                        "${widget.checkpoint.content.completed() ? nQuestions : qAnswered} von ${nQuestions} Fragen beantwortet",
                        style: TextStyle(fontSize: 15),
                      )
                    : Container()
              ],
            ))
      ]);
    } else if (widget.checkpoint.content.runtimeType == Info) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(width: 50),
        Row(children: [
          Container(width: widget.checkpoint.position * 30),
          circleWithI(Colors.lightGreen, Colors.lightGreen),
          Container(width: (1 - widget.checkpoint.position) * 30)
        ]),
        Container(
          margin: EdgeInsets.only(left: 10),
          width: 200,
          child: Text(
            widget.checkpoint.title,
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          ),
        )
      ]);
    }
    return Container();
  }

  @override
  void initState() {
    update();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CheckpointWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    update();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: getWidget(),
        onTap: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      widget.checkpoint.content.runtimeType == Quiz
                          ? QuizPage(
                              title: widget.checkpoint.title,
                              quiz: widget.checkpoint.content,
                            )
                          : InfoPage(content: widget.checkpoint.content)));
          widget.onClosed();
        });
  }

  Container circleWithId([Color? colorDone, Color? colorNotDone]) {
    return Container(
      decoration: BoxDecoration(
          color: widget.checkpoint.content.completed()
              ? colorDone ?? Colors.green
              : colorNotDone ?? Colors.grey,
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

  Container circleWithI([Color? colorDone, Color? colorNotDone]) {
    return Container(
      decoration: BoxDecoration(
          color: widget.checkpoint.content.completed()
              ? colorDone ?? Colors.green
              : colorNotDone ?? Colors.grey,
          shape: BoxShape.circle),
      height: 85,
      width: 50,
      margin: EdgeInsets.only(left: 5),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(11),
          child: Text("?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
