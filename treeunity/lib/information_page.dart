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
      required this.height});

  final Widget child;
  final Widget background;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: background,
              height: height,
              width: 400,
            ),
            Center(child: child)
          ],
        ),
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
  List<Image> images = [
    Image.asset("assets/images/Himmel.jpg",
        fit: BoxFit.cover,
        color: Colors.black.withAlpha(100),
        colorBlendMode: BlendMode.srcOver),
    Image.asset("assets/images/Veranstaltungen.jpg",
        fit: BoxFit.cover,
        color: Colors.black.withAlpha(100),
        colorBlendMode: BlendMode.srcOver),
    Image.asset("assets/images/Kultur.jpg",
        fit: BoxFit.cover,
        color: Colors.black.withAlpha(100),
        colorBlendMode: BlendMode.srcOver),
  ];

  @override
  void initState() {
    super.initState();
    wetter();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (Image i in images) {
      precacheImage(i.image, context);
    }
  }

  wetter() async {
    WeatherFactory wf = WeatherFactory("4b3ac13c71f264b8d8d5caf0870cba94",
        language: Language.GERMAN);
    List<Weather> forecast =
        await wf.fiveDayForecastByCityName("Bernau bei Berlin");
    print(forecast);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoCard(
            background: Image.asset("assets/images/Himmel.jpg",
                fit: BoxFit.cover,
                color: Colors.black.withAlpha(100),
                colorBlendMode: BlendMode.srcOver),
            height: 175,
            child: Text("Wetter",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          InfoCard(
            background: Image.asset("assets/images/Veranstaltungen.jpg",
                fit: BoxFit.cover,
                color: Colors.black.withAlpha(100),
                colorBlendMode: BlendMode.srcOver),
            height: 175,
            child: Text("Veranstaltungen",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          InfoCard(
            background: Image.asset("assets/images/Kultur.jpg",
                fit: BoxFit.cover,
                color: Colors.black.withAlpha(100),
                colorBlendMode: BlendMode.srcOver),
            height: 175,
            child: Text("Kunst",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
