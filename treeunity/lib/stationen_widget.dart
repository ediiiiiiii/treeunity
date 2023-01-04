// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:treeunity/checkpoint_builder.dart';

class StationenWidget extends StatelessWidget {
  const StationenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.fromLTRB(35, 20, 35, 20),
          height: 110,
          alignment: Alignment.centerLeft,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stationen",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
                Text(
                  "Tippe auf eine Station, um mehr über sie zu erfahren. Beantworte die Fragen, um im Lernpfad weiterzukommen.",
                  style: TextStyle(fontSize: 16),
                )
              ])),
      CheckpointBuilder()
    ]);
  }
}
