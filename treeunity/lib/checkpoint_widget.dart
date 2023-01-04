// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treeunity/pulverturm_page.dart';

class CheckpointWidget extends StatelessWidget {
  const CheckpointWidget(
      {Key? key,
      required this.title,
      required this.id,
      required this.position,
      this.numberOfQuestions = 0,
      this.questionsAnswered = 0})
      : super(key: key);
  final String title;
  final int id;
  final double position;

  final int numberOfQuestions;

  final int questionsAnswered;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(children: [
            Container(width: position * 30),
            circleWithId(),
            Container(width: (1 - position) * 30)
          ]),
          Container(
              margin: EdgeInsets.only(left: 10),
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w200),
                    textAlign: TextAlign.start,
                  ),
                  numberOfQuestions != 0
                      ? Text(
                          "$questionsAnswered von $numberOfQuestions Fragen beantwortet",
                          style: TextStyle(fontSize: 16),
                        )
                      : Container()
                ],
              ))
        ]),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PulverturmPage()));
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
      child: Center(
        child: Container(
          margin: EdgeInsets.all(22),
          child: Text(id.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
