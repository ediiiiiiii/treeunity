// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:treeunity/lernpfad/checkpoint_builder.dart';
import 'package:treeunity/data/data.dart';
import 'package:treeunity/line_drawer.dart';

class StationenWidget extends StatelessWidget {
  const StationenWidget({super.key, this.onClosed});
  final Function? onClosed;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.centerLeft,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stationen",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
                Text(
                  "Tippe auf eine Station, um mehr über sie zu erfahren. Beantworte die Fragen, um im Lernpfad weiterzukommen.",
                  style: TextStyle(fontSize: 16),
                )
              ])),
      CheckpointBuilder(
        lernpfad: lernpfad,
        onClosed: () {
          if (onClosed != null) {
            onClosed!();
          }
        },
      )
    ]);
  }
}
