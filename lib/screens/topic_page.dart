import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_fact_app/database/database.dart';
import 'package:ultimate_fact_app/screens/home_page.dart';
// import 'package:ultimate_fact_app/home_page/fact_page.dart';
import 'package:ultimate_fact_app/screens/list_page.dart';

// facts_Listview facts_container = facts_Listview();

class topic_grid extends StatefulWidget {
  const topic_grid({super.key});

  @override
  State<topic_grid> createState() => _topic_gridState();
}

class _topic_gridState extends State<topic_grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        leadingWidth: 0,
        elevation: 0,
        title: Center(
          child: Text(
            "Topics",
            style: TextStyle(color: Colors.black38, fontSize: 25),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
              // height: 800,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        prefixIcon: Container(
                          margin: const EdgeInsets.only(left: 20, right: 15),
                          child: Icon(
                            CupertinoIcons.search,
                            size: 25,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                        labelText: 'Search facts',
                        labelStyle:
                            TextStyle(fontSize: 25, color: Colors.black38),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none)),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    // height: 800,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15),
                      itemCount: topic_image.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return facts_Listview(index: index,);
                                    },
                                  ));
                                });
                              },
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            topic_image[index]['image']),
                                        fit: BoxFit.cover),
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              topic_image[index]['title'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              )),
          bottom_navigation()
        ],
      ),
    );
  }
}
