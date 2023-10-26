// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/screens/facts_page.dart';
import 'package:ultimate_fact_app/screens/topic_page.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';

class facts_Listview extends StatefulWidget {
  facts_Listview({
    super.key,
    this.factdiscription,
    this.factimage,
    this.facttitle,
    this.heartcount,
  });
  var heartcount;
  var facttitle;
  var factdiscription;
  var factimage;

  @override
  State<facts_Listview> createState() => _facts_ListviewState();
}

class _facts_ListviewState extends State<facts_Listview> {
  int newlike = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      body: ListView.builder(
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
                          heartcount: index,
                          facttitle: home_Screen_facts_data[index]['title'],
                          factdiscription: home_Screen_facts_data[index]
                              ['discription'],
                          factimage: home_Screen_facts_data[index]['image']);
                    },
                  ));
                });
              },
              child: Container(
                height: 480,
                width: double.infinity,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
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
                              dearcount: index,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              home_Screen_facts_data[index]['title'],
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.34),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Less Then 1 min.read',
                                style: TextStyle(color: Colors.black38),
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
                                  fontSize: 20, color: uicolor.fontcolorgrey),
                            ),
                          )
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
    );
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


//  heartcount: index,
//                           facttitle: home_Screen_facts_data[index]['title'],
//                           factdiscription: home_Screen_facts_data[index]
//                               ['discription'],
//                           factimage: home_Screen_facts_data[index]['image']