// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizWidget extends StatefulWidget {
  QuizWidget({Key? key}) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Wie wo was?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            TextButton(onPressed: () {}, child: Text("Antwort 1")),
            TextButton(onPressed: () {}, child: Text("Antwort 2")),
            TextButton(onPressed: () {}, child: Text("Antwort 3")),
          ],
        ),
      ),
    );
  }
}
