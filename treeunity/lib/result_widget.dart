// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:treeunity/data/data.dart';

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(text: "Du hast bereits ", style: TextStyle(fontSize: 18)),
            TextSpan(
                text: "${(lernpfad.progress() * 100).toInt()} %",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.green)),
            TextSpan(
                text: " des Lernpfads abgeschlossen.",
                style: TextStyle(fontSize: 18))
          ], style: DefaultTextStyle.of(context).style),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
