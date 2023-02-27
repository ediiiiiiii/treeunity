import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:treeunity/lernpfad/data_structure.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({required this.content, super.key});
  final Info content;
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black54, size: 35),
        title: Text(
          widget.content.title,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: widget.content.content,
    );
  }
}
