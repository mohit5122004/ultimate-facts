// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/screens/facts_page.dart';
// import 'package:ultimate_fact_app/screens/topic_page.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';
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
// class listrunner{
// runner(){
// final fact = fact_data[index]['kids'][0];
// }
// }

// class topic_logic {
//  static topic({required var index}) {
//   }
// }

// for (int i = 0; i < fact_data[0].length; i++) {
//       fact_data.forEach((entry) {
//         entry.forEach((key, _) {
//           print('$key');
//           if (widget.index == i) {
//             fact = fact_data[0]["$key"];
//             factlenth = fact_data[0]['$key'];
//             print(key);
//           }
//         });
//       });
//     }

var fact;
var factlenth;
// int newlike = 200;

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            'Topic Search',
            style: TextStyle(color: Colors.black38, fontSize: 25),
          ),
        ),
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
                          index_page: index,
                          factlike: fact[index]['like'],
                          facttitle: fact[index]['title'],
                          factdiscription: fact[index]['discription'],
                          factimage: fact[index]['image']);
                    },
                  ));
                });
              },
              child: fact_container(index: index),
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

fact_container({required int index}) {
  return Container(
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
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage(fact[index]['image']), fit: BoxFit.cover)),
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
                  likedatapath: fact[index]['like'],
                  // dearcount: index,
                  // dearcount: 0,
                  likedata: fact[index]['like'],
                  // onhear_tap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "${fact[index]['title']}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
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
                  '${fact[index]['subtitle']}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(fontSize: 20, color: uicolor.fontcolorgrey),
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
      {
      // required this.onhear_tap,
      required,
      required this.likedata,
      required this.likedatapath});

  // VoidCallback onhear_tap;
  var likedata;
  var likedatapath;

  @override
  State<icons_bar> createState() => _icons_barState();
}

var newlike;

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
                    // heartap == true ? newlike++ : newlike--;

                    heartap = !heartap;
                    // widget.onhear_tap;
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
