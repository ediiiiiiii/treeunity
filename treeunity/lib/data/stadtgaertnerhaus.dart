// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class StadtgaertnerhausInfo extends StatelessWidget {
  const StadtgaertnerhausInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: "Seide in Bernau?\n",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                  TextSpan(
                    text:
                        "\nNach dem dreißigjährigen Krieg galt es auch das ausgeplünderte Bernau regenerieren zu lassen. Friedrich Wilhelm der Erste förderte die Besiedlung des derzeitig menschenleeren Landes. Ein größeres Problem boten jedoch die knappen finanziellen Mittel. Im ganzen Land breiteten sich verschiedene künstlerische Branchen aus. In Bernau sollte es die Seidenraupenzucht sein. Neben den Seidenraupen wurde im Bernauer Stadtpark jedoch auch ein Garten für eine Maulbeerenzucht angelegt. 1783 errichtete die Stadt dafür das Seidenbauhaus. Hier sollte die gewonnene Seide verarbeitet werden und gleichzeitig ein Wohnheim für den Pächter der Plantage bieten. Dieses Gebäude steht noch heute. Nun wird es jedoch Stadtgärtnerhaus genannt. ",
                  )
                ]),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Silkworm_China.jpg/640px-Silkworm_China.jpg"),
          Text(
            "Anubis85 KH, CC BY-SA 3.0 via Wikimedia Commons",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
