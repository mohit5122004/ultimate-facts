// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/Colors.dart';
import 'package:ultimate_fact_app/Signup_login/login_screen.dart';

class third_screen extends StatefulWidget {
  third_screen({super.key});

  @override
  State<third_screen> createState() => _third_screenState();
}

class _third_screenState extends State<third_screen> {
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
          Text(
            'Benefits',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color.fromARGB(190, 211, 245, 206),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    benefit_row(
                        benefit_text: 'Improve Your Brain Function',
                        circular_color: Color(0xfff3a987),
                        benefit_icon: Icon(Icons.self_improvement_outlined)),
                    SizedBox(height: 20),
                    benefit_row(
                        benefit_text: 'Start Better Conversations',
                        circular_color: Color(0xff73eba7),
                        benefit_icon: Icon(Icons.self_improvement_outlined)),
                    SizedBox(height: 20),
                    benefit_row(
                        benefit_text: 'Stay Motivated',
                        circular_color: Color(0xff9de8fd),
                        benefit_icon: Icon(Icons.self_improvement_outlined)),
                    SizedBox(height: 20),
                    benefit_row(
                        benefit_text: 'Have Fun',
                        circular_color: Color(0xffd3a5f5),
                        benefit_icon: Icon(Icons.self_improvement_outlined)),
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
                                  return login_screen();
                                },
                              ));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
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

class benefit_row extends StatelessWidget {
  benefit_row(
      {super.key,
      required this.benefit_text,
      required this.benefit_icon,
      required this.circular_color});
  String benefit_text;
  Icon benefit_icon;
  Color circular_color;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        radius: 25,
        backgroundColor: circular_color,
        child: Icon(
          benefit_icon.icon,
          size: 35,
          color: Colors.white,
        ),
      ),
      SizedBox(width: 15),
      Text(
        benefit_text,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black45),
      )
    ]);
  }
}
