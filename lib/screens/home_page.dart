// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/screens/list_page.dart';


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