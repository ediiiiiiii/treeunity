// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ColoredCircle extends StatelessWidget {
  const ColoredCircle(
      {super.key, required this.child, required this.color, this.size = 32});

  final Widget child;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        alignment: Alignment.center,
        child: child);
  }
}
