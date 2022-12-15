// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:treeunity/quiz_widget.dart';

class PulverturmPage extends StatelessWidget {
  const PulverturmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: ListView(children: [
          Text("Ein Turm im Park, der es in sich hat:"),
          QuizWidget()
        ]),
      ),
      appBar: AppBar(
        title: Text("Pulverturm"),
      ),
    );
  }
}
