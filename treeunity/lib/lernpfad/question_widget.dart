// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treeunity/checkpoint_builder.dart';
import 'package:treeunity/lernpfad/data_structure.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.question});
  final Question question;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(widget.question.question,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          widget.question.child ?? Container(),
          ColumnBuilder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.question.responds[index],
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              );
            },
            itemCount: widget.question.responds.length,
          ),
          Container(
              margin: EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {},
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    "ÜBERPRÜFEN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
