// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:treeunity/checkpoint_builder.dart';
import 'package:treeunity/colored_circle.dart';
import 'package:treeunity/lernpfad/data_structure.dart';
import 'package:treeunity/lernpfad/slide_animation.dart';
import 'package:flutter/animation.dart';

import 'animated_progress_bar.dart';
import 'animated_response_button.dart';

class AnimatedQuestionPage extends StatefulWidget {
  const AnimatedQuestionPage(
      {super.key, required this.question, required this.onNextQuestion});
  final Function onNextQuestion;
  final Question question;
  @override
  State<AnimatedQuestionPage> createState() => _AnimatedQuestionPageState();
}

class _AnimatedQuestionPageState extends State<AnimatedQuestionPage> {
  late Widget questionPage;

  @override
  void initState() {
    super.initState();
    questionPage = QuestionPage(
      onNextQuestion: () => widget.onNextQuestion(),
      question: widget.question,
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedQuestionPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    questionPage = QuestionPage(
      onNextQuestion: () => widget.onNextQuestion(),
      question: widget.question,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideAnimation2(
      child: questionPage,
      onFinished: () => print("anim done"),
    );
  }
}

class QuizCompletedWidget extends StatefulWidget {
  const QuizCompletedWidget({super.key, required this.onFinished});
  final Function onFinished;

  @override
  State<QuizCompletedWidget> createState() => _QuizCompletedWidgetState();
}

class _QuizCompletedWidgetState extends State<QuizCompletedWidget> {
  late RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation("Check", autoplay: false);
    _controller.isActive = false;

    playDelayed(Duration(milliseconds: 400));
  }

  void playDelayed(Duration delay) async {
    await Future.delayed(delay);
    _controller.isActive = true;
    await Future.delayed(Duration(seconds: 2));
    widget.onFinished();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            "Lektion abgeschlossen!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 260),
          child: SizedBox(
            width: 200,
            height: 200,
            child: RiveAnimation.asset(
              "assets/checkmark.riv",
              controllers: [_controller],
            ),
          ),
        )
      ],
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage(
      {super.key, required this.title, required this.quiz, this.onFinished});

  final String title;
  final Quiz quiz;
  final Function? onFinished;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Question question;
  late List<Widget> questionWidgets = [];
  late Function init;

  void nextQuestion() {
    widget.quiz.nextQuestion();
    question = widget.quiz.currentQuestion();
    setState(() {});
  }

  @override
  void initState() {
    if (widget.quiz.completed()) {
      question = widget.quiz.currentQuestion();
      init = () {};
    } else {
      question = widget.quiz.currentQuestion();
      init = () {
        if (mounted) {
          Navigator.pop(context);
        }
        if (widget.onFinished != null) {
          widget.onFinished!();
        }
      };
      for (Question question in widget.quiz.questions) {
        questionWidgets.add(QuestionPage(
          onNextQuestion: nextQuestion,
          question: question,
          key: UniqueKey(),
        ));
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation,
            Animation<double> animationTwo) {
          return SlideTransition(
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                .animate(
                    CurvedAnimation(parent: animation, curve: Curves.ease)),
            child: SlideTransition(
              position: Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
                  .animate(CurvedAnimation(
                      parent: animationTwo, curve: Curves.ease)),
              child: child,
            ),
          );
        },
        child: widget.quiz.completed()
            ? QuizCompletedWidget(
                onFinished: init,
              )
            : questionWidgets[widget.quiz.currentQuestionIndex()],
      ),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: AnimatedProgressBar(
            value: widget.quiz.progress() * 100.0,
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
            if (widget.onFinished != null) {
              widget.onFinished!();
            }
          },
          iconSize: 40,
        ),
        centerTitle: false,
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage(
      {super.key, required this.onNextQuestion, required this.question});
  final Function onNextQuestion;
  final Question question;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int selectedResponse = -1;
  int responseCorrect = -1;

  void _retry() {
    setState(() {
      selectedResponse = -1;
      responseCorrect = -1;
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
          onPressed: selectedResponse != -1
              ? () {
                  if (responseCorrect == -1) {
                    setState(() {
                      if (widget.question.answer == selectedResponse) {
                        responseCorrect = 1;
                      } else {
                        responseCorrect = 0;
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
          onPressed: selectedResponse != -1
              ? () {
                  _retry();
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
          onPressed: selectedResponse != -1
              ? () {
                  widget.onNextQuestion();
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
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          appBar2,
          SizedBox(height: 10),
          Text(widget.question.question,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          Spacer(),
          widget.question.child ?? Container(),
          Spacer(),
          ColumnBuilder(
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: AnimatedRespondButton(
                      onTap: (bool selected, bool correct, bool incorrect) {
                        if (correct == false &&
                            incorrect == false &&
                            responseCorrect == -1) {
                          if (selectedResponse != index) {
                            selectedResponse = index;
                          } else {
                            selectedResponse = -1;
                          }
                          setState(() {});
                        }
                      },
                      initialValues: [
                        selectedResponse == index,
                        (responseCorrect != -1
                                ? responseCorrect == 1
                                : false) &&
                            selectedResponse == index,
                        responseCorrect != -1 ? responseCorrect == 0 : false
                      ],
                      child: Center(
                          child: Text(widget.question.responds[index],
                              style: TextStyle(
                                  fontSize: 22,
                                  color: responseCorrect == 1 &&
                                          selectedResponse == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: responseCorrect == 1 &&
                                          selectedResponse == index
                                      ? FontWeight.bold
                                      : FontWeight.normal)))));
            },
            itemCount: widget.question.responds.length,
          ),
          responseCorrect == 0
              ? retryButton
              : (responseCorrect == 1 ? nextButton : checkButton)
        ],
      ),
    );
  }
}
