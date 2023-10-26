// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/home_page/facts_listview.dart';


class uicolor {
  static Color icongrey = Colors.grey;
  static Color textgrey = Colors.grey;
  static Color fontcolorgrey = Colors.black38;
}

var like = 0;
var heartcolor = Colors.pinkAccent;
var heartap = false;

class home_page extends StatefulWidget {
  home_page({
    super.key,
  });

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: facts_Listview());
  }
}

class icons_bar extends StatefulWidget {
  icons_bar({
    required this.dearcount,
    // required this.onhear_tap,
  });

  int dearcount = 0;
  // VoidCallback onhear_tap;
  @override
  State<icons_bar> createState() => _icons_barState();
}

class _icons_barState extends State<icons_bar> {
  int newlike = 100;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    heartap = !heartap;
                    // heartap == true ? newlike++ : newlike--;
                    for (int i = 0; i < home_Screen_facts_data.length; i++) {
                      heartap == true
                          ? home_Screen_facts_data[i]['like']++
                          : home_Screen_facts_data[i]['like']--;
                    }

                    // widget.onhear_tap;
                  });
                },
                splashRadius: 10,
                icon: Icon(
                  heartap == true
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  fill: 1,
                  color: heartap == true ? heartcolor : uicolor.icongrey,
                  size: 30,
                )),
            Text(
              home_Screen_facts_data[widget.dearcount]['like'].toString(),
              style: TextStyle(
                  fontSize: 22,
                  color: uicolor.textgrey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.play_circle,
                  color: Colors.green.shade600,
                  size: 28,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bookmark,
                  color: uicolor.icongrey,
                  size: 28,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.paperplane,
                  color: uicolor.icongrey,
                  size: 28,
                )),
          ],
        ),
      ],
    );
  }
}
