import 'package:flutter/material.dart';
import 'package:treeunity/stationen_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [StationenWidget()], physics: BouncingScrollPhysics());
  }
}
