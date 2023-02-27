// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PulverturmInfo extends StatelessWidget {
  const PulverturmInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(28),
      child: Column(
        children: [
          Text(
            "Bullengehege",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "\nIn Bernau bei Berlin steht der Pulverturm an der Stadtmauer. Mit einer Höhe von 29 Metern diente er einst als Wachturm und wurde auch als Bullenturm bezeichnet, da er neben dem ehemaligen Bullen-Gehege erbaut wurde. Das Gehege wurde im 17. Jahrhundert angelegt und später vermutlich in einen Stadtpark umgewandelt. Der Zugang zum Turm erfolgte früher über eine Leiter. Die Stadtmauer, die mit Türmen und Stadttoren versehen war, wurde bereits um 1380 errichtet. Bernau bei Berlin wurde nach der Eroberung des Gebiets durch die Askanier im Jahr 1200 gegründet.",
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
