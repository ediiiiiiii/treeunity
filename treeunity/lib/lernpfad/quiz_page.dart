// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:treeunity/colored_circle.dart';
import 'package:treeunity/quiz/quiz_data_structure.dart';
import 'package:treeunity/quiz/quiz_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.title, required this.quiz});

  final String title;
  final Quiz quiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  SMIInput<double>? progressInput;
  late Timer t;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    progressInput = controller.findInput<double>("Progress") as SMINumber;
  }

  @override
  void initState() {
    t = Timer.periodic(Duration(seconds: 1), (timer) {
      progressInput?.value += 1;
      if (progressInput?.value == 100) {
        progressInput?.value = 0;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 15, 20, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ColoredCircle(
                        color: Colors.green,
                        child: Text(
                          "Q",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        "QUIZ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: ColoredCircle(
                      color: Colors.orange,
                      child: Icon(
                        Icons.question_mark,
                        color: Colors.white,
                      )),
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                )
              ],
            ),
            SizedBox(height: 15),
            QuizWidget(
              quiz: widget.quiz,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: SizedBox(
          height: 45,
          child: RiveAnimation.asset(
            "assets/loading_bar.riv",
            artboard: "Loading Bar",
            stateMachines: ["State Machine 1"],
            alignment: Alignment.centerLeft,
            onInit: _onRiveInit,
          ),
        ),
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 40,
        ),
        centerTitle: false,
      ),
    );
  }
}
