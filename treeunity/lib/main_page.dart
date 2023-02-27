// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:treeunity/result_widget.dart';
import 'package:treeunity/info_stationen_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, this.onClosed});
  final Function? onClosed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 28),
      children: [
        StationenWidget(onClosed: () {
          if (onClosed != null) {
            onClosed!();
          }
        }),
        ResultWidget()
      ],
    );
  }
}
