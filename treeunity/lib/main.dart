// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeunity/checkpoint_widget.dart';
import 'package:treeunity/information_page.dart';

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
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(title: 'Treeunity'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  final List<Widget> _pages = <Widget>[
    ListView(
      children: [
        Container(
          child: Column(
            children: [
              Text(
                "Stationen",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                  "Der Stadtpark und seine wundervolle App. Das hier ist ein tolles Tutorial.")
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          margin: EdgeInsets.all(20),
          height: 100,
        ),
        CheckpointWidget(
          title: "Pulverturm",
          id: 1,
        ),
        CheckpointWidget(
          title: "Stadthaus",
          id: 2,
        ),
        CheckpointWidget(
          title: "Spielplatz",
          id: 3,
        ),
        CheckpointWidget(
          title: "Eiche",
          id: 4,
        )
      ],
      physics: ClampingScrollPhysics(),
    ),
    InformationPage(),
    Text("3 Seite"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Text(
              "Die Stadtpark-App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            )
          ],
        ),
        centerTitle: true,
        toolbarHeight: 85,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_nature_rounded),
            label: 'Lernpfad',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Informationen',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Einstellungen',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
