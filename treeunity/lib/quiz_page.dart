// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:treeunity/quiz_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.title});

  final String title;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  SMIInput<double>? progressInput;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    progressInput = controller.findInput<double>("progress") as SMINumber;
  }

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
        foregroundColor: Colors.black,
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
