// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MuehlentorInfo extends StatelessWidget {
  const MuehlentorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 28),
        children: [
          Text(
            "Mühlentor",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text(
            "\nDas Mühlentor steht seit 2013 etwa an der Stelle, an der 1885 die Reste des alten Mühlentors abgerissen wurden. Damals hieß es, es behindere und gefährde den Verkehr auf der Mühlenstraße. Das Mühlentor war einst ein dreitoriges Stadttor. Die Stadtmauer mit Türmen und Toren entstand um 1380.",
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Bernau_bei_Berlin_M%C3%BChlentor.jpg/730px-Bernau_bei_Berlin_M%C3%BChlentor.jpg"),
          SizedBox(height: 10),
          Text(
            "Lichterfelder, CC BY-SA 3.0 via Wikimedia Commons",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Text(
              "Rund um das Mühlentor befinden sich eine Reihe von Denkmälern. Das am 19. Oktober 1890 eingeweihte Kriegerdenkmal in der Mühlenstraße erinnert an die gefallenen Bernauer Soldaten der drei deutschen Einigungskriege (1864, 1866, 1870/71). Gegenüber dem Ehrenmal wurde 1947 der „Ehrenfriedhof für die Gefallenen der Roten Armee“ errichtet. Am 15. Mai, dem „Tag der Kriegsdienstverweigerer“, wurde 1998 in unmittelbarer Nähe der anderen Denkmäler das „Deserteurdenkmal“ eingeweiht. Neben dem Scharfrichterhaus steht seit 2005 das von Annelie Grund geschaffene „Denkmal für die Opfer der Hexenverfolgung“."),
          SizedBox(height: 20),
          Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Bernau_bei_Berlin_Ehrenfriedhof_Rote_Armee_Obelisk.jpg/761px-Bernau_bei_Berlin_Ehrenfriedhof_Rote_Armee_Obelisk.jpg"),
          SizedBox(height: 10),
          Text(
            "User:Dabbelju, CC BY-SA 3.0 via Wikimedia Commons",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Bernau_bei_Berlin_Deserteurdenkmal.JPG/800px-Bernau_bei_Berlin_Deserteurdenkmal.JPG"),
          SizedBox(height: 10),
          Text(
            "Von User:Dabbelju - Eigenes Werk, CC BY-SA 3.0, https://commons.wikimedia.org/w/index.php?curid=853613",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ]);
  }
}
