// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/weather.dart';

class BoxRounded extends StatelessWidget {
  const BoxRounded({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Colors.lightGreen[200],
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: Offset(3, 3),
                color: Colors.black.withAlpha(10))
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      margin: EdgeInsets.only(bottom: 20),
      child: child,
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard(
      {super.key,
      required this.child,
      required this.background,
      required this.height,
      required this.darken});

  final Widget child;
  final Widget background;
  final double height;
  final int darken;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  background,
                  Container(
                    color: Colors.black.withAlpha(darken),
                  )
                ],
              ),
            ),
          ),
          Center(child: child)
        ],
      ),
    );
  }
}

class InformationPage extends StatefulWidget {
  InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  wetter() async {
    WeatherFactory wf = WeatherFactory("4b3ac13c71f264b8d8d5caf0870cba94",
        language: Language.GERMAN);
    List<Weather> forecast =
        await wf.fiveDayForecastByCityName("Bernau bei Berlin");
    print(forecast);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 30),
        InfoCard(
          background: Image.asset(
            "assets/images/Himmel.jpg",
            fit: BoxFit.cover,
          ),
          height: 175,
          darken: 100,
          child: Text("Wetter",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        InfoCard(
          background: Image.asset(
            "assets/images/Veranstaltungen.jpg",
            fit: BoxFit.cover,
          ),
          height: 250,
          darken: 100,
          child: Text("Veranstaltungen",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        InfoCard(
          background: Image.asset(
            "assets/images/Kultur.jpg",
            fit: BoxFit.cover,
          ),
          height: 175,
          darken: 100,
          child: Text("Kunst",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ],
    );
  }
}
