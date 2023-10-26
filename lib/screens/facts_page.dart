import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/screens/facts_list.dart';
import 'package:ultimate_fact_app/screens/home_screen.dart';

var runners;

class indexrun {
  static runner() {
    int i = 0;
    while (i < home_Screen_facts_data.length) {
      runners = i;
      return runners + i;
    }
    i++;
  }
}

// ignore: must_be_immutable
class facts_page_view extends StatelessWidget {
  facts_page_view(
      {super.key,
      required this.facttitle,
      required this.heartcount,
      required this.factdiscription,
      required this.factimage});
  var facttitle;
  var factimage;
  var factdiscription;
  var heartcount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                CupertinoIcons.back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return facts_Listview();
                  },
                ));
              },
            ),
            toolbarTextStyle: TextStyle(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: true,
            centerTitle: false,
            stretch: true,
            expandedHeight: 300,
            titleTextStyle: TextStyle(color: Colors.black),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                facttitle,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              background: Image(
                image: AssetImage(factimage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  icons_bar(
                    dearcount: heartcount,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      factdiscription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                        color: uicolor.fontcolorgrey,
                      ),
                    ),
                  ),
                  SizedBox(height: 400)
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
