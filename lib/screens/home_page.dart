// ignore_for_file: must_be_immutable

// import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/screens/bookmark_page.dart';
import 'package:ultimate_fact_app/screens/facts_page.dart';
import 'package:ultimate_fact_app/screens/list_page.dart';
import 'package:ultimate_fact_app/screens/settings_page.dart';
// import 'package:ultimate_fact_app/database/database.dart';
// import 'package:ultimate_fact_app/screens/list_page.dart';
import 'package:ultimate_fact_app/screens/topic_page.dart';
import 'package:ultimate_fact_app/database/Colors.dart';

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
    settingcolor;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leadingWidth: 0,
          elevation: 0,
          leading: Text(''),
          backgroundColor: uicolor.backgroundColor,
          title: Center(
            child: Text(
              'Ultimate Facts Pro',
              style: TextStyle(fontSize: 25, color: uicolor.title),
            ),
          ),
        ),
        body: Stack(
          children: [home_page_list(), bottom_navigation()],
        ));
  }
}

// var fact = fact_data[0]['kids'];

class home_page_list extends StatefulWidget {
  const home_page_list({super.key});

  @override
  State<home_page_list> createState() => _home_page_listState();
}

class _home_page_listState extends State<home_page_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uicolor.backgroundColor,
      body: Column(
        children: [
          Expanded(
            // height: 650,
            child: ListView.builder(
              itemCount: home_Screen_facts_data.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 550, minHeight: 480),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return facts_page_view(
                                indexpath: index,
                                routeonback: home_page(),
                                factlike: home_Screen_facts_data[index]['like'],
                                // index_page: index,
                                facttitle: home_Screen_facts_data[index]
                                    ['title'],
                                factdiscription: home_Screen_facts_data[index]
                                    ['discription'],
                                factimage: home_Screen_facts_data[index]
                                    ['image']);
                          },
                        ));
                      });
                    },
                    child: Container(
                      height: 480,
                      width: double.infinity,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: uicolor.factcontainer,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 0.61,
                                blurRadius: 4)
                          ],
                          // color: Colors.yellow.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        home_Screen_facts_data[index]['image']),
                                    fit: BoxFit.cover)),
                          )),
                          Expanded(
                              child: Container(
                            // padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: icons_bar(
                                    factdiscription:
                                        home_Screen_facts_data[index]
                                            ['discription'],
                                    pathindex: index,
                                    likedatapath: home_Screen_facts_data[index]
                                        ['like'],
                                    factimage: home_Screen_facts_data[index]
                                        ['image'],
                                    factlike: home_Screen_facts_data[index]
                                        ['like'],
                                    factsubtitle: home_Screen_facts_data[index]
                                        ['subtitle'],
                                    facttitle: home_Screen_facts_data[index]
                                        ['title'],
                                    likedata: newlike,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    home_Screen_facts_data[index]['title'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: uicolor.ftitle,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: uicolor.readbg,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      'Less Then 1 min.read',
                                      style: TextStyle(color: uicolor.readline),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    home_Screen_facts_data[index]['subtitle'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 20, color: uicolor.subtitle),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}

class bottom_navigation extends StatefulWidget {
  const bottom_navigation({super.key});

  @override
  State<bottom_navigation> createState() => _bottom_navigationState();
}

class _bottom_navigationState extends State<bottom_navigation> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: uicolor.backgroundColor,
        height: 70,
        // width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return home_page();
                        },
                      ));
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.home,
                    color: uicolor.navicon,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Home',
                    style: TextStyle(color: uicolor.navicon),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return topic_grid();
                        },
                      ));
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.square_list,
                    color: uicolor.navicon,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Topics',
                    style: TextStyle(color: uicolor.navicon),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return bookmark_page();
                        },
                      ));
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.bookmark,
                    color: uicolor.navicon,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Bookmark',
                    style: TextStyle(color: uicolor.navicon),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return setting_page();
                        },
                      ));
                    });
                  },
                  icon: Icon(
                    CupertinoIcons.settings,
                    color: uicolor.navicon,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Settings',
                    style: TextStyle(color: uicolor.navicon),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
