// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SpielplatzInfo extends StatelessWidget {
  const SpielplatzInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 28),
      physics: BouncingScrollPhysics(),
      children: [
        Text(
          "Spielplatz",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          "\nIm Stadtpark gibt es einen Spielplatz mit verschiedenen Geräten und Sicherheits-maßnahmen. Neben einer 30 Meter langen Seilbahn gibt es eine Ritterburg aus Holz, eine Drehscheibe und ein Wackeltier-Drachen. Kies, Sand und Rindenmulch schützen die Kinder bei einem Sturz. Auf dem Spielplatz gibt es auch Sitzbänke für Eltern und Betreuer. Am Rande des Spielplatzes gibt es eine Motorik-Strecke mit fünf Elementen, um sich auszuprobieren und nicht langweilig zu werden.",
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
        Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Bernau-Stadtpark_Spielpl3.JPG/640px-Bernau-Stadtpark_Spielpl3.JPG"),
        SizedBox(height: 10),
        Text(
          "Catatine, CC BY-SA 4.0 via Wikimedia Commons",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }
}
