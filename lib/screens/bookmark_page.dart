import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/screens/facts_page.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';
import 'package:ultimate_fact_app/screens/list_page.dart';
import 'package:ultimate_fact_app/database/Colors.dart';

class bookmark_page extends StatefulWidget {
  const bookmark_page({super.key});

  @override
  State<bookmark_page> createState() => _bookmark_pageState();
}

List<dynamic> bookmark = [];

class _bookmark_pageState extends State<bookmark_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uicolor.backgroundColor,
      appBar: AppBar(
        leadingWidth: 0,
        leading: Text(''),
        backgroundColor: uicolor.backgroundColor,
        elevation: 0,
        title: Center(
          child: Text(
            'Bookmark',
            style: TextStyle(fontSize: 25, color: uicolor.textgrey),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: bookmark.length,
                    itemBuilder: (context, index) {
                      bookmarkbt;
                      return bookmark[index]['like'] != null
                          ? InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return facts_page_view(
                                      factdiscription: bookmark[index]
                                          ['discription'],
                                      factlike: bookmark[index]['like'],
                                      factimage: bookmark[index]['image'],
                                      indexpath: index,
                                      facttitle: bookmark[index]['title'],
                                      routeonback: bookmark_page(),
                                    );
                                  },
                                ));
                              },
                              child: fact_container(
                                  indexs: index,
                                  factlike: bookmark[index]['like'],
                                  facttitle: bookmark[index]['title'],
                                  factimage: bookmark[index]['image'],
                                  factsubtitle: bookmark[index]['subtitle']),
                            )
                          : Container();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
          bottom_navigation()
        ],
      ),
    );
  }
}
