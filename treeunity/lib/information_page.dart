import 'package:flutter/widgets.dart';

class InformationPage extends StatefulWidget {
  InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [Text("1"), Text("2")],
    ));
  }
}
