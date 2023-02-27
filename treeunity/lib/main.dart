// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeunity/lernpfad/checkpoint_builder.dart';
import 'package:treeunity/lernpfad/checkpoint_widget.dart';
import 'package:treeunity/information_page.dart';
import 'package:treeunity/main_page.dart';
import 'package:treeunity/info_stationen_widget.dart';
import 'package:treeunity/page_select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
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
        body: TabBarView(children: [
          MainPage(
            onClosed: () {
              setState(() {
                print("upda");
              });
            },
          ),
          InformationPage()
        ], controller: _tabController),
        bottomNavigationBar: PageSelector(
          value: _tabController.index,
          tabController: _tabController,
        ),
        extendBody: true,
      ),
    );
  }
}
