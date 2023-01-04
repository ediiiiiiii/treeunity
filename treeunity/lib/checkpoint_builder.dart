// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:treeunity/checkpoint_widget.dart';

class CheckpointBuilder extends StatefulWidget {
  const CheckpointBuilder({super.key});

  @override
  State<CheckpointBuilder> createState() => _CheckpointBuilderState();
}

class _CheckpointBuilderState extends State<CheckpointBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckpointWidget(
            title: "Pulverturm",
            id: 1,
            position: 0.1,
            numberOfQuestions: 2,
            questionsAnswered: 2),
        CheckpointWidget(
            title: "Stadthaus",
            id: 2,
            position: 0.4,
            numberOfQuestions: 3,
            questionsAnswered: 3),
        CheckpointWidget(
            title: "Spielplatz",
            id: 3,
            position: 0.8,
            numberOfQuestions: 2,
            questionsAnswered: 1),
        CheckpointWidget(
            title: "Eiche",
            id: 4,
            position: 0.6,
            numberOfQuestions: 4,
            questionsAnswered: 0),
        CheckpointWidget(
            title: "Ecke",
            id: 5,
            position: 0.3,
            numberOfQuestions: 7,
            questionsAnswered: 0),
        CheckpointWidget(
            title: "Schild",
            id: 6,
            position: 0.0,
            numberOfQuestions: 2,
            questionsAnswered: 0),
        CheckpointWidget(
            title: "Ahorn",
            id: 7,
            position: 0.2,
            numberOfQuestions: 3,
            questionsAnswered: 0),
        CheckpointWidget(
            title: "Wallanlage",
            id: 8,
            position: 0.4,
            numberOfQuestions: 1,
            questionsAnswered: 0),
        CheckpointWidget(
            title: "Peter",
            id: 9,
            position: 0.1,
            numberOfQuestions: 6,
            questionsAnswered: 0),
      ],
    );
  }
}
