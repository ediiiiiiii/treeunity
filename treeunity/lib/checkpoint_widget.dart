// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treeunity/pulverturm_page.dart';

class CheckpointWidget extends StatefulWidget {
  final String title;
  final int id;
  final double position;
  CheckpointWidget(
      {Key? key, required this.title, required this.id, required this.position})
      : super(key: key);

  @override
  State<CheckpointWidget> createState() => _CheckpointWidgetState();
}

class _CheckpointWidgetState extends State<CheckpointWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(children: [
            Container(width: widget.position * 30),
            circleWithId(),
            Container(width: (1 - widget.position) * 30)
          ]),
          Container(
              margin: EdgeInsets.only(left: 10),
              width: 160,
              child: Text(widget.title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w200)))
        ]),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PulverturmPage()));
        });
  }

  Container circleWithId() {
    return Container(
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      height: 85,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(22),
          child: Text(widget.id.toString(),
              style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
    );
  }
}
