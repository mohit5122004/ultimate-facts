// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/Colors.dart';
import 'package:ultimate_fact_app/database/database.dart';
// import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/screens/bookmark_page.dart';
import 'package:ultimate_fact_app/screens/facts_page.dart';
// import 'package:ultimate_fact_app/screens/topic_page.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';
import 'package:ultimate_fact_app/screens/settings_page.dart';
import 'package:ultimate_fact_app/screens/topic_page.dart';

class facts_Listview extends StatefulWidget {
  facts_Listview({
    super.key,
    this.factdiscription,
    this.factimage,
    this.facttitle,
    required this.index,
    // this.heartcount,
  });
  // var heartcount;
  var facttitle;
  var factdiscription;
  var factimage;
  int index;
  @override
  State<facts_Listview> createState() => _facts_ListviewState();
}

var fact;
var factlenth;

class _facts_ListviewState extends State<facts_Listview> {
  @override
  Widget build(BuildContext context) {
    fact;
    final topicilist = [
      'apple',
      'art',
      'astalia',
      'canada',
      "car",
      "cat&dogs",
      'cuba',
      'earth',
      'fashion',
      'food',
      'football',
      'google',
      'health',
      'history',
      'hitler',
      'humanbody',
      'india',
      'inspiration',
      'intresting',
      'japan',
      'kids',
      'lion',
      'brain',
      'scince',
      'socialmedia',
      'tech',
      'time',
      'uk',
    ];

    final topicindex = widget.index;
    fact = fact_data[0]
        [topicindex < topicilist.length ? topicilist[topicindex] : "uk"];
    factlenth = fact_data[0][topicilist[topicindex]].length;
    settingcolor;
    return Scaffold(
      backgroundColor: uicolor.backgroundColor,
      appBar: AppBar(
        foregroundColor: uicolor.title,
        elevation: 0,
        title: Center(
          child: Text(
            'Topic Search',
            style: TextStyle(color: uicolor.title, fontSize: 25),
          ),
        ),
        backgroundColor: uicolor.backgroundColor,
        leading: IconButton(
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
            CupertinoIcons.back,
            color: uicolor.navicon,
            size: 25,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: factlenth,
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
                          routeonback: topic_grid(),
                          factlike: fact[index]['like'],
                          facttitle: fact[index]['title'],
                          factdiscription: fact[ index]['discription'],
                          factimage: fact[index]['image']);
                    },
                  ));
                });
              },
              child: fact_container(
                  indexs: index,
                  factimage: fact[index]['image'],
                  factlike: fact[index]['like'],
                  factsubtitle: fact[index]['subtitle'],
                  facttitle: fact[index]['title']),
            ),
          );
        },
      ),
    );
  }

  Container color_container({required int index}) {
    return Container(
      height: 480,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.green.shade400,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 0.61,
                blurRadius: 4)
          ],
          // color: Colors.yellow.shade300,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        '$index : ${fact[index]['subtitle']}',
        style: TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
      )),
    );
  }
}

fact_container(
    {required int indexs,
    required var factlike,
    required String facttitle,
    required var factimage,
    required var factsubtitle,
    VoidCallback? bookmark_remove}) {
  return Container(
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
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage(factimage), fit: BoxFit.cover)),
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
                  factimage: factimage,
                  factlike: factlike,
                  factsubtitle: factsubtitle,
                  facttitle: facttitle,
                  pathindex: indexs,
                  likedatapath: factlike,
                  likedata: factlike,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  facttitle,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: uicolor.ftitle),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                      color: uicolor.readbg,
                      borderRadius: BorderRadius.circular(20)),
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
                  factsubtitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(fontSize: 20, color: uicolor.subtitle),
                ),
              )
            ],
          ),
        )),
      ],
    ),
  );
}

class icons_bar extends StatefulWidget {
  icons_bar(
      {required this.likedata,
      required this.pathindex,
      required var this.factlike,
      required String this.facttitle,
      required var this.factimage,
      String this.factsubtitle = '',
      String this.factdiscription = '',
      required this.likedatapath});

  var likedata;
  var likedatapath;
  var pathindex;
  var factlike;
  String facttitle;
  var factimage;
  var factsubtitle;
  var factdiscription;
  @override
  State<icons_bar> createState() => _icons_barState();
}

var newlike;
// var bookmarkdata;
// var bookmarkdatapath;

var bookmarkbt = false;

class _icons_barState extends State<icons_bar> {
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
                // onPressed: onhear_tap,
                onPressed: () {
                  setState(() {
                    heartap = !heartap;
                    widget.likedata = heartap == true
                        ? widget.likedatapath++
                        : widget.likedatapath--;
                    widget.likedata = widget.likedatapath;
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
              widget.likedatapath.toString(),
              style: TextStyle(
                  fontSize: 22,
                  color: uicolor.liketext,
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
                onPressed: () {
                  setState(() {
                    bookmarkbt = !bookmarkbt;
                    if (bookmarkbt == true) {
                      bookmark.add({
                        'like': widget.factlike,
                        'title': widget.facttitle,
                        'subtitle': widget.factsubtitle,
                        'image': widget.factimage,
                        'discription': widget.factdiscription,
                      });
                    } else {
                      bookmark[widget.pathindex]['like'] = null;
                      bookmark[widget.pathindex]['title'] = null;
                      bookmark[widget.pathindex]['subtitle'] = null;
                      bookmark[widget.pathindex]['image'] = null;
                      bookmark[widget.pathindex]['discription'] = null;
                    }
                  });
                },
                icon: Icon(
                  bookmarkbt == false
                      ? CupertinoIcons.bookmark
                      : CupertinoIcons.bookmark_fill,
                  color: bookmarkbt == false
                      ? uicolor.icongrey
                      : uicolor.bookmarkicon,
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
