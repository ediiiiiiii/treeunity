// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:treeunity/lernpfad/checkpoint_widget.dart';
import 'package:treeunity/data/data.dart';
import 'package:treeunity/line_drawer.dart';
import 'package:treeunity/lernpfad/data_structure.dart';

class ColumnBuilder extends StatelessWidget {
  const ColumnBuilder({
    Key? key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  final IndexedWidgetBuilder? itemBuilder;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(itemCount!, (index) => itemBuilder!(context, index))
              .toList(),
    );
  }
}

class CheckpointBuilder extends StatefulWidget {
  final Lernpfad lernpfad;
  const CheckpointBuilder({super.key, required this.lernpfad});

  @override
  State<CheckpointBuilder> createState() => _CheckpointBuilderState();
}

class _CheckpointBuilderState extends State<CheckpointBuilder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: LineDrawer(xValue: widget.lernpfad.getPositions()),
        child: ColumnBuilder(
            itemBuilder: (context, index) {
              return CheckpointWidget(
                  checkpoint: widget.lernpfad.checkpoints[index],
                  onClosed: () => setState(() {}));
            },
            itemCount: widget.lernpfad.checkpoints.length));
  }
}
