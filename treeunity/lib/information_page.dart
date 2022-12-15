import 'package:flutter/widgets.dart';
import 'package:weather/weather.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wetter();
  }

  wetter() async {
    WeatherFactory wf = new WeatherFactory("d6036fc2d5d9a22a18b1b7320ef6ac23",
        language: Language.GERMAN);
    Weather w = await wf.currentWeatherByCityName('Bernau bei Berlin');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [Text("1"), Text("2")],
    ));
  }
}
