import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/screens/list_page.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';

var runners;

// ignore: must_be_immutable
class facts_page_view extends StatelessWidget {
  facts_page_view(
      {super.key,
      this.facttitle = '',
      this.factdiscription,
      this.factlike = '',
      required this.indexpath,
      required this.routeonback,
      this.factimage});
  var facttitle;
  var factimage;
  var routeonback;
  var factdiscription;
  var indexpath;

  var factlike;
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
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return routeonback;
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
                    factimage: factimage,
                    factlike: factlike,
                    facttitle: facttitle,
                    pathindex: indexpath,
                    likedatapath: factlike,factdiscription:factdiscription ,
                    likedata: factlike,
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
          ])),
        ],
      ),
    );
  }
}
