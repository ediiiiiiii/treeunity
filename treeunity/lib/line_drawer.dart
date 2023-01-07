import 'package:flutter/material.dart';

class LineDrawer extends CustomPainter {
  LineDrawer(this.keys,
      {this.xValue = const [0.1, 0.4, 0.8, 0.6, 0.3, 0.0, 0.2, 0.4, 0.1],
      this.height = 85,
      this.width = 60,
      this.xOffset = 60,
      this.xScaling = 30});
  final List<double> xValue;
  final double height;
  final double width;
  final double xOffset;
  final double xScaling;
  final List<Key> keys;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < xValue.length - 1; i++) {
      double xPosition = xValue[i] * xScaling + xOffset + width / 2;
      double yPosition = (height * i) + height / 2;
      double x2Position = xValue[i + 1] * xScaling + xOffset + width / 2;
      double y2Position = (height * (i + 1)) + height / 2;
      canvas.drawLine(
          Offset(xPosition, yPosition),
          Offset(x2Position, y2Position),
          Paint()
            ..color = Colors.green.shade700
            ..strokeWidth = 3);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
