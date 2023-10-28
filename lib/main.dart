import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';
// import 'package:ultimate_fact_app/screens/topic_page.dart';
// import 'package:ultimate_fact_app/home_page/home_screen.dart';
import 'package:ultimate_fact_app/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home_page()));
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Splash_Screen();
  }
}
