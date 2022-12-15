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
    WeatherFactory wf = WeatherFactory("4b3ac13c71f264b8d8d5caf0870cba94",
        language: Language.GERMAN);
    //Weather w = await wf.currentWeatherByCityName('Bernau bei Berlin');
    List<Weather> forecast = await wf.fiveDayForecastByCityName("Berlin");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [Text("1"), Text("2")],
    ));
  }
}
