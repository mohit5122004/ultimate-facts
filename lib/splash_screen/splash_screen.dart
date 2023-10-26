import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/splash_logo.png',
            ),
          )),
        ),
      ),
    );
  }
}
