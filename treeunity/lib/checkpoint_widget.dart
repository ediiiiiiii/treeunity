// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:treeunity/pulverturm_page.dart';

class CheckpointWidget extends StatefulWidget {
  String title;
  int id;
  CheckpointWidget({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  State<CheckpointWidget> createState() => _CheckpointWidgetState();
}

class _CheckpointWidgetState extends State<CheckpointWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration:
                BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            height: 100,
            child: Center(
                child: Container(
              child: Text(
                widget.id.toString(),
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              margin: EdgeInsets.all(18),
            )),
          ),
          Container(
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 25),
            ),
            margin: EdgeInsets.only(left: 10),
          ),
        ],
      ),
      onTap: () {
        print("Tap");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PulverturmPage()),
        );
      },
    );
  }
}
