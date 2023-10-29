import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/Colors.dart';
import 'package:ultimate_fact_app/start_screen/third_screen.dart';

class second_screen extends StatefulWidget {
  const second_screen({super.key});

  @override
  State<second_screen> createState() => _second_screenState();
}

class _second_screenState extends State<second_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(right: 15),
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  topRight: Radius.circular(70)),
              color: Color.fromARGB(190, 211, 245, 206),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Did You Know?',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Text(
                      'A Rececnt study has revealed that 70 - 87 % of people experience positive changes in learning motivation, social interactions, general well-being and life satisfaction when they adopta continuous learning habit.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 25, wordSpacing: 2, color: Colors.black45),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: uicolor.startbtcolor),
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return third_screen();
                                },
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Text('Continue',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22)),
                          )),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
