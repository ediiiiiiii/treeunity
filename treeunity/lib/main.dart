// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeunity/checkpoint_builder.dart';
import 'package:treeunity/checkpoint_widget.dart';
import 'package:treeunity/information_page.dart';
import 'package:treeunity/main_page.dart';
import 'package:treeunity/stationen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treeunity',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(title: 'Treeunity'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              Text(
                "Die Stadtpark-App",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              )
            ],
          ),
          centerTitle: true,
          toolbarHeight: 85,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
        ),
        body: TabBarView(children: [MainPage(), InformationPage(), Text("ho")]),
        bottomNavigationBar: Container(
          child: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.emoji_nature), child: Text("Lernpfad")),
                Tab(
                    icon: Icon(Icons.info_outline_rounded),
                    child: Text("Information")),
                Tab(icon: Icon(Icons.settings), child: Text("Einstellungen"))
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              indicatorColor: Colors.green[100]),
          color: Colors.green,
        ),
      ),
    );
  }
}
