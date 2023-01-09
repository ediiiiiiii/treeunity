// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:treeunity/checkpoint_builder.dart';
import 'package:treeunity/colored_circle.dart';
import 'package:treeunity/lernpfad/data_structure.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.title, required this.quiz});

  final String title;
  final Quiz quiz;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Rive Controller

  List<List<SMIInput<bool>>> buttonControl = [];

  int selectedRespond = -1;
  int respondCorrect = -1;

  void nextQuestion() {
    widget.quiz.nextQuestion();
    retry();
  }

  void retry() {
    setState(() {
      selectedRespond = -1;
      respondCorrect = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar2 = Row(
      // zweite AppBar
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          // Symbol plus Text (Quiz)
          children: [
            ColoredCircle(
                // Symbol für Frage
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
              // Quiz Text
              margin: EdgeInsets.only(left: 8),
              child: Text(
                "QUIZ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        IconButton(
            // für Fragen
            onPressed: () {},
            icon: ColoredCircle(
                color: Colors.orange,
                child: Icon(
                  Icons.question_mark,
                  color: Colors.white,
                )),
            padding: EdgeInsets.zero,
            splashRadius: 20)
      ],
    );
    Widget checkButton = Container(
        margin: EdgeInsets.only(top: 40),
        child: ElevatedButton(
          onPressed: selectedRespond != -1
              ? () {
                  if (respondCorrect == -1) {
                    setState(() {
                      if (widget.quiz.currentQuestion().answer ==
                          selectedRespond) {
                        respondCorrect = 1;
                      } else {
                        respondCorrect = 0;
                      }
                    });
                  }
                }
              : null,
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "ÜBERPRÜFEN",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ));
    Widget retryButton = Container(
        margin: EdgeInsets.only(top: 40),
        child: ElevatedButton(
          onPressed: selectedRespond != -1
              ? () {
                  retry();
                }
              : null,
          style:
              ElevatedButton.styleFrom(backgroundColor: Colors.yellow.shade700),
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "Nochmal versuchen?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ));
    Widget nextButton = Container(
        margin: EdgeInsets.only(top: 40),
        child: ElevatedButton(
          onPressed: selectedRespond != -1
              ? () {
                  nextQuestion();
                }
              : null,
          style:
              ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade200),
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "Nächste Frage >",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black87),
            ),
          ),
        ));
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 15, 30, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appBar2,
            SizedBox(height: 10),
            Text(widget.quiz.currentQuestion().question,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Spacer(),
            widget.quiz.currentQuestion().child ?? Container(),
            Spacer(),
            ColumnBuilder(
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: AnimatedRespondButton(
                      onTap: (bool selected, bool correct, bool incorrect) {
                        if (correct == false &&
                            incorrect == false &&
                            respondCorrect == -1) {
                          setState(() {
                            if (selectedRespond != index) {
                              selectedRespond = index;
                            } else {
                              selectedRespond = -1;
                            }
                          });
                        }
                      },
                      initialValues: [
                        selectedRespond == index,
                        (respondCorrect != -1 ? respondCorrect == 1 : false) &&
                            selectedRespond == index,
                        respondCorrect != -1 ? respondCorrect == 0 : false
                      ],
                      child: Center(
                          child: Text(
                        widget.quiz.currentQuestion().responds[index],
                        style: TextStyle(
                            fontSize: 22,
                            color:
                                respondCorrect == 1 && selectedRespond == index
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight:
                                respondCorrect == 1 && selectedRespond == index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                      )),
                    ));
              },
              itemCount: widget.quiz.currentQuestion().responds.length,
            ),
            respondCorrect == 0
                ? retryButton
                : (respondCorrect == 1 ? nextButton : checkButton)
          ],
        ),
      ),
      appBar: AppBar(
        // mit Fortschrittsanzeige
        title: AnimatedProgressBar(),
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

class AnimatedProgressBar extends StatefulWidget {
  AnimatedProgressBar({super.key});

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  Artboard? _riveArtboard;
  SMIInput<double>? progressControl;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addListener(() {
        setState(() {
          progressControl?.value = animation.value;
        });
      });
    controller.forward();
    rootBundle.load('assets/loading_bar.riv').then((data) async {
      final file = RiveFile.import(data);
      final artboard = file.artboardByName("Loading Bar")!;

      final riveController =
          StateMachineController.fromArtboard(artboard, 'State Machine 1');
      artboard.addController(riveController!);

      progressControl =
          riveController.findInput<double>("Progress") as SMINumber;

      print("init progressbar done");
      setState(() => _riveArtboard = artboard);
      await Future.delayed(Duration(seconds: 2));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtboard == null
        ? SizedBox()
        : SizedBox(
            height: 45,
            child: Rive(
              artboard: _riveArtboard!.instance(),
              alignment: Alignment.centerLeft,
            ),
          );
  }
}

class AnimatedRespondButton extends StatefulWidget {
  const AnimatedRespondButton(
      {super.key,
      this.child,
      required this.onTap,
      required this.initialValues});
  final Widget? child;
  final Function onTap;
  final List<bool> initialValues;

  @override
  State<AnimatedRespondButton> createState() => _AnimatedRespondButtonState();
}

class _AnimatedRespondButtonState extends State<AnimatedRespondButton> {
  late SMIInput<bool> selected;
  late SMIInput<bool> correct;
  late SMIInput<bool> incorrect;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);

    selected = controller.findInput<bool>("selected") as SMIBool;
    correct = controller.findInput<bool>("correct") as SMIBool;
    incorrect = controller.findInput<bool>("incorrect") as SMIBool;
    selected.value = widget.initialValues[0];
    correct.value = widget.initialValues[1];
    incorrect.value = widget.initialValues[2];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 60,
        child: Stack(
          children: [
            RiveAnimation.asset(
              "assets/loading_bar.riv",
              artboard: "Button",
              onInit: _onRiveInit,
              fit: BoxFit.fill,
              stateMachines: ["State Machine 1"],
            ),
            widget.child ?? Container()
          ],
        ),
      ),
      onTapDown: (TapDownDetails t) {
        widget.onTap(
          selected.value,
          correct.value,
          incorrect.value,
        );
      },
    );
  }
}
