import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/start_screen/second_screen.dart';

import 'package:ultimate_fact_app/database/Colors.dart';

class welcome_screen extends StatefulWidget {
  const welcome_screen({super.key});

  @override
  State<welcome_screen> createState() => _welcome_screenState();
}

class _welcome_screenState extends State<welcome_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 5),
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  topLeft: Radius.circular(
                    70,
                  )),
              color: Color.fromARGB(190, 211, 245, 206),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Text(
                  'Welcome To \nThe World OF Fact!',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                Text(
                  'Ultimate Facts',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 47, 160, 105)),
                ),
                SizedBox(height: 10),
                Text(
                  'Your Trusted Companion in your learning journey to science, culture, and art.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // Expanded(child: SizedBox()),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return second_screen();
                              },
                            ));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 2,
                            backgroundColor: uicolor.startbtcolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Start',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                size: 25,
                                color: Colors.black,
                              )
                            ],
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
