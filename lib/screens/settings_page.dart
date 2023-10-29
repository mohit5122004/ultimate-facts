import 'package:flutter/material.dart';
// import 'package:ultimate_fact_app/screens/home_page.dart';
import 'package:ultimate_fact_app/database/Colors.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';
import 'package:ultimate_fact_app/start_screen/welcome_screen.dart';
// import 'package:ultimate_fact_app/database/Colors.dart';

class setting_page extends StatefulWidget {
  const setting_page({super.key});

  @override
  State<setting_page> createState() => _setting_pageState();
}

bool settingcolor = false;
// var modebt=true;

class _setting_pageState extends State<setting_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uicolor.backgroundColor,
      appBar: AppBar(
        backgroundColor: uicolor.backgroundColor,
        elevation: 0,
        leadingWidth: 0,
        leading: Text(''),
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 25, color: uicolor.fontcolorgrey),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: uicolor.darkbt,
                      ),
                      onPressed: () {
                        setState(() {
                          // uicolor.backgroundColor = Colors.black;
                          settingcolor = !settingcolor;

                          if (settingcolor == true) {
                            uicolor.backgroundColor = Colors.black;
                            uicolor.factcontainer = Color(0xff1a222f);
                            uicolor.fontcolorgrey =
                                Colors.grey.withOpacity(0.7);
                            uicolor.navicon = Colors.white;
                            uicolor.darkbt = Colors.white;
                            uicolor.darktext = Colors.black;
                            uicolor.liketext = Colors.grey;
                            uicolor.ftitle =
                                const Color.fromARGB(255, 212, 207, 207);
                            uicolor.title = Colors.grey;
                            uicolor.subtitle = Colors.grey;
                            uicolor.readbg = Colors.blueGrey.shade300;
                            uicolor.readline = Colors.black;
                            uicolor.bookmarkicon = Colors.grey;
                            uicolor.textfild = Colors.white;
                            uicolor.discription = Colors.blueGrey.shade400;
                          } else {
                            uicolor.textfild = Colors.grey.withOpacity(0.3);
                            uicolor.bookmarkicon = Colors.black;
                            uicolor.liketext = Colors.blueGrey;
                            uicolor.readbg = Colors.grey.withOpacity(0.2);
                            uicolor.darkbt = Colors.black;
                            uicolor.darktext = Colors.white;
                            uicolor.discription = Colors.black38;
                            uicolor.readline = Colors.black38;
                            uicolor.backgroundColor = Colors.white;
                            uicolor.factcontainer = Colors.white;
                            uicolor.fontcolorgrey = Colors.white54;
                            uicolor.title = Colors.black38;
                            uicolor.ftitle = Colors.black;
                            uicolor.subtitle = Colors.black38;
                            uicolor.navicon = Colors.black;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          settingcolor == true
                              ? 'Dark Mode Off'
                              : 'Dart Mode On',
                          style:
                              TextStyle(fontSize: 25, color: uicolor.darktext),
                        ),
                      )),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Log Out',
                        style:
                            TextStyle(fontSize: 25, color: uicolor.darktext)),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return welcome_screen();
                        },
                      ));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: uicolor.darkbt,
                  ),
                )
              ],
            ),
          ),
          bottom_navigation()
        ],
      ),
    );
  }
}
