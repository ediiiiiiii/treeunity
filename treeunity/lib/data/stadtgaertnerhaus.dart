// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class StadtgaertnerhausInfo extends StatelessWidget {
  const StadtgaertnerhausInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 28),
      physics: BouncingScrollPhysics(),
      children: [
        Text("Seidenzucht",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        Text(
          "\nNach dem Dreißigjährigen Krieg musste auch das geplünderte Bernau wieder aufgebaut werden. Friedrich Wilhelm I. förderte die Besiedlung des bis dahin menschenleeren Landes. Ein größeres Problem stellten jedoch die knappen finanziellen Mittel dar. Im ganzen Land entwickelten sich verschiedene Gewerbezweige, in Bernau sollte es die Seidenraupenzucht sein. Neben den Seidenraupen wurde im Bernauer Stadtpark auch ein Garten für die benötigten Maulbeerbäume angelegt. 1783 errichtete die Stadt dafür das Seidenbauhaus. Hier sollte die gewonnene Seide verarbeitet werden und gleichzeitig dem Pächter der Plantage als Wohnung dienen. Dieses Gebäude steht noch heute, allerdings unter dem Namen Stadtgärtnerhaus.",
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
        Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Silkworm_China.jpg/640px-Silkworm_China.jpg"),
        SizedBox(height: 10),
        Text(
          "Anubis85 KH, CC BY-SA 3.0 via Wikimedia Commons",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }
}
