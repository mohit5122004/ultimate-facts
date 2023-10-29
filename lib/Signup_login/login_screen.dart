import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/Signup_login/ragister_screen.dart';

import 'package:ultimate_fact_app/database/Colors.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => login_screenState();
}

class login_screenState extends State<login_screen> {
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
            padding: EdgeInsets.only(left: 15, right: 5),
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  topLeft: Radius.circular(70)),
              color: Color.fromARGB(190, 211, 245, 206),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Login Now',
                          style: TextStyle(
                              fontSize: 25,
                              color: uicolor.startbtcolor,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return register_screen();
                                },
                              ));
                            });
                          },
                          child: Text(
                            'Register?',
                            style: TextStyle(
                                fontSize: 21,
                                color: uicolor.startbtcolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: textfield_decoration(
                          label: 'Email',
                          fieldicon: Icon(Icons.alternate_email_outlined)),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: textfield_decoration(
                          label: 'Password',
                          fieldicon: Icon(Icons.lock_outline_rounded)),
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
                                  return home_page();
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

  InputDecoration textfield_decoration(
      {required String label, required Icon fieldicon}) {
    return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 25, color: uicolor.startbtcolor),
        suffixIcon: Icon(
          fieldicon.icon,
          color: uicolor.startbtcolor,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        contentPadding: EdgeInsets.all(20),
        fillColor: Colors.green.withOpacity(0.4),
        filled: true);
  }
}
