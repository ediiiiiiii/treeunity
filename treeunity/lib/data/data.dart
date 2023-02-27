import 'package:flutter/material.dart';
import 'package:treeunity/data/pulverturm.dart';
import 'package:treeunity/data/spielplatz.dart';
import 'package:treeunity/data/stadtgaertnerhaus.dart';
import 'package:treeunity/lernpfad/data_structure.dart';

Lernpfad lernpfad = Lernpfad(checkpoints: [
  Checkpoint(
      content: Info(
        content: PulverturmInfo(),
      ),
      title: "Bullengehege",
      position: 0.4,
      id: 0),
  Checkpoint(
      content: Quiz(questions: [
        Question(
          question:
              "Was war die Funktion des Pulverturms in Bernau bei Berlin?",
          responds: ["Verkaufsstand für Pulver", "Wachturm", "Gefängnis"],
          answer: 1,
        ),
        Question(
          question:
              "Warum wurde der Pulverturm auch als Bullenturm bezeichnet?",
          responds: [
            "ehemaliges Gehege für Stiere",
            "Lagerung von Bullenfleisch",
            "bullenähnliche Form"
          ],
          answer: 0,
        ),
        Question(
          question: "Wann wurde Bernau bei Berlin gegründet?",
          responds: ["1300", "1200", "1100"],
          answer: 1,
        ),
      ]),
      id: 1,
      title: "Pulverturm",
      position: 0.5),
  Checkpoint(
      content: Info(
        content: SpielplatzInfo(),
      ),
      title: "Spielplatz",
      position: 0.4,
      id: 0),
  Checkpoint(
      content: Quiz(questions: [
        Question(
          question:
              "Welche Maßnahmen schützen Kinder auf dem Spielplatz bei einem Sturz?",
          responds: [
            "Kies, Sand und Rindenmulch",
            "Holz, Metall und Plastik",
            " Gras und Erde"
          ],
          answer: 0,
        ),
        Question(
            question:
                "Was bietet die Motorik-Strecke am Rande des Spielplatzes?",
            responds: [
              "Fünf Elemente zum Ausprobieren",
              "Eine 30 Meter lange Seilbahn",
              "Eine Ritterburg aus Holz"
            ],
            answer: 0,
            child: Image.asset("assets/images/Baum.jpg")),
      ]),
      id: 2,
      title: "Spielplatz",
      position: 0.2),
  Checkpoint(
      content: Quiz(questions: [
        Question(
          question: "Coming Soon",
          responds: ["Antwort 1"],
          answer: 0,
        ),
      ]),
      id: 3,
      title: "Eisladen",
      position: 0.0),
  Checkpoint(
      content: Info(title: "Seide", content: StadtgaertnerhausInfo()),
      title: "Seide",
      position: 0.1,
      id: 2),
  Checkpoint(
      content: Quiz(questions: [
        Question(
          question:
              "Was war das größte Problem bei der Regeneration von Bernau nach dem dreißigjährigen Krieg?",
          responds: [
            "Knappe finanzielle Mittel",
            "Menschenleeres Land",
            "Fehlende Infrastruktur"
          ],
          answer: 0,
        ),
        Question(
          question:
              "Was sollte in Bernau gefördert werden, um künstlerische Branchen im Land zu etablieren?",
          responds: ["Textilproduktion", "Seidenraupenzucht", "Kunsthandwerk"],
          answer: 1,
        ),
        Question(
          question:
              "Was wurde neben der Seidenraupenzucht im Bernauer Stadtpark angelegt?",
          responds: ["Gemüsegarten", "Obstgarten", "Maulbeerenzucht"],
          answer: 2,
        ),
        Question(
          question: "Was wurde im Jahr 1783 von der Stadt Bernau errichtet?",
          responds: ["Eine Kirche", "Ein Rathaus", "Ein Seidenbauhaus"],
          answer: 2,
        ),
        Question(
          question: "Was war die Funktion des Seidenbauhauses?",
          responds: [
            "Wohnheim des Bürgermeister",
            "Seidenraupenzucht",
            "Verarbeitung der Seide"
          ],
          answer: 2,
        ),
        Question(
          question: "Wie wird das Seidenbauhaus heute genannt?",
          responds: ["Stadtparkhaus", "Plantagenhaus", "Stadtgärtnerhaus"],
          answer: 2,
        )
      ]),
      id: 4,
      title: "Stadtgärtnerhaus",
      position: 0.3),
  Checkpoint(
      content: Quiz(questions: [
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
          question: "Wo findet man das?",
          responds: ["Spielplatz", "Stadthaus", "Graben"],
          answer: 2,
        ),
        Question(
          question: "Why?",
          responds: ["Kein Plan", "Ahhh", "o"],
          answer: 2,
        ),
      ]),
      id: 5,
      title: "Gymnasium",
      position: 0.6),
  Checkpoint(
      content: Quiz(questions: [
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
          question: "Why?",
          responds: ["Kein Plan", "Ahhh", "o"],
          answer: 2,
        ),
        Question(
          question: "Warum ist das so?",
          responds: ["Antwort 1", "Antwort 2", "Antwort3"],
          answer: 2,
        ),
        Question(
          question: "Wähle Weise",
          responds: ["Antwort 1", "Antwort 2", "Antwort3", "Antwort4"],
          answer: 2,
        )
      ]),
      id: 6,
      title: "Johanna Schule",
      position: 0.8),
  Checkpoint(
      content: Quiz(questions: [
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
          question: "Wo findet man das?",
          responds: ["Spielplatz", "Stadthaus", "Graben"],
          answer: 2,
        ),
        Question(
          question: "Why?",
          responds: ["Kein Plan", "Ahhh", "o"],
          answer: 2,
        ),
        Question(
          question: "Warum ist das so?",
          responds: ["Antwort 1", "Antwort 2", "Antwort3"],
          answer: 2,
        ),
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
          question: "Wähle Weise",
          responds: ["Antwort 1", "Antwort 2", "Antwort3", "Antwort4"],
          answer: 2,
        )
      ]),
      id: 7,
      title: "Mühlentor",
      position: 0.9),
  Checkpoint(
      content: Quiz(questions: [
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
          question: "Wo findet man das?",
          responds: ["Spielplatz", "Stadthaus", "Graben"],
          answer: 2,
        ),
        Question(
          question: "Why?",
          responds: ["Kein Plan", "Ahhh", "o"],
          answer: 2,
        ),
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
            question: "Welche Baumart ist hier zu sehen?",
            responds: ["Birke", "Eiche", "Buche"],
            answer: 2,
            child: Image.asset("assets/images/Baum.jpg")),
        Question(
          question: "Warum ist das so?",
          responds: ["Antwort 1", "Antwort 2", "Antwort3"],
          answer: 2,
        ),
        Question(
          question: "Wähle Weise",
          responds: ["Antwort 1", "Antwort 2", "Antwort3", "Antwort4"],
          answer: 2,
        )
      ]),
      id: 8,
      title: "Kriegerdenkmal",
      position: 0.8),
]);
