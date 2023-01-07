// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:treeunity/checkpoint_widget.dart';
import 'package:treeunity/line_drawer.dart';

class ColumnBuilder extends StatelessWidget {
  const ColumnBuilder({
    Key? key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  final IndexedWidgetBuilder? itemBuilder;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(itemCount!, (index) => itemBuilder!(context, index))
              .toList(),
    );
  }
}

class CheckpointBuilder extends StatefulWidget {
  final int itemCount;
  final List<String> titles;
  final List<double> xValue;
  final List<int> nQuestions;
  final List<int> nAnsweredQuestions;

  const CheckpointBuilder({
    super.key,
    this.itemCount = 8,
    this.titles = const [
      "Pulverturm",
      "Stadthaus",
      "Spielplatz",
      "Eiche",
      "Ecke",
      "Schild",
      "Ahorn",
      "Wallanlage"
    ],
    this.xValue = const [0.1, 0.4, 0.8, 0.6, 0.3, 0.0, 0.2, 0.4],
    this.nQuestions = const [4, 3, 5, 6, 2, 7, 8, 4],
    this.nAnsweredQuestions = const [4, 3, 3, 0, 0, 0, 0, 0],
  });

  @override
  State<CheckpointBuilder> createState() => _CheckpointBuilderState();
}

class _CheckpointBuilderState extends State<CheckpointBuilder> {
  late List<GlobalObjectKey> keys = [];
  @override
  void initState() {
    for (int i = 0; i < widget.itemCount; i++) {
      keys.add(GlobalObjectKey(i));
    }
    super.initState();
    getPositions();
  }

  void getPositions() async {
    await Future.delayed(Duration(milliseconds: 200));
    for (int i = 0; i < keys.length; i++) {
      var currentKey = keys[i];
      final RenderBox? renderBox =
          currentKey.currentContext?.findRenderObject() as RenderBox?;
      Offset? position =
          renderBox?.localToGlobal(Offset.zero); //this is global position
      double? y = position?.dy; //this is y - I think it's what you want
      print(y);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: LineDrawer(keys, xValue: widget.xValue),
        child: ColumnBuilder(
            itemBuilder: (context, index) {
              return CheckpointWidget(
                key: keys[index],
                title: widget.titles[index],
                id: index,
                position: widget.xValue[index],
                numberOfQuestions: widget.nQuestions[index],
                questionsAnswered: widget.nAnsweredQuestions[index],
              );
            },
            itemCount: widget.itemCount));
    // return Column(
    //   children: [
    //     CheckpointWidget(
    //         title: "Pulverturm",
    //         id: 1,
    //         position: 0.1,
    //         numberOfQuestions: 2,
    //         questionsAnswered: 2),
    //     CheckpointWidget(
    //         title: "Stadthaus",
    //         id: 2,
    //         position: 0.4,
    //         numberOfQuestions: 3,
    //         questionsAnswered: 3),
    //     CheckpointWidget(
    //         title: "Spielplatz",
    //         id: 3,
    //         position: 0.8,
    //         numberOfQuestions: 2,
    //         questionsAnswered: 1),
    //     CheckpointWidget(
    //         title: "Eiche",
    //         id: 4,
    //         position: 0.6,
    //         numberOfQuestions: 4,
    //         questionsAnswered: 0),
    //     CheckpointWidget(
    //         title: "Ecke",
    //         id: 5,
    //         position: 0.3,
    //         numberOfQuestions: 7,
    //         questionsAnswered: 0),
    //     CheckpointWidget(
    //         title: "Schild",
    //         id: 6,
    //         position: 0.0,
    //         numberOfQuestions: 2,
    //         questionsAnswered: 0),
    //     CheckpointWidget(
    //         title: "Ahorn",
    //         id: 7,
    //         position: 0.2,
    //         numberOfQuestions: 3,
    //         questionsAnswered: 0),
    //     CheckpointWidget(
    //         title: "Wallanlage",
    //         id: 8,
    //         position: 0.4,
    //         numberOfQuestions: 1,
    //         questionsAnswered: 0),
    //     CheckpointWidget(
    //         title: "Peter",
    //         id: 9,
    //         position: 0.1,
    //         numberOfQuestions: 6,
    //         questionsAnswered: 0),
    //   ],
    // );
  }
}
