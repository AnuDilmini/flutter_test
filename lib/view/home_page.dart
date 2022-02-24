import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_test/common_widget/horizontal_card.dart';
import 'package:interview_test/common_widget/product_card.dart';
import 'package:http/http.dart' as http;
import 'package:interview_test/utils/constant.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> fetchProduct() async {
    final response = await http
        .get(Uri.parse(Constant.PRODUCT_URL));

    if (response.statusCode == 200) {

      print("reponse ********************* ${response.body}");
      // return Product.fromJson(jsonDecode(response.body));
      return true;
    } else {

      throw Exception('Failed to load album');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child:Container(
        height:  MediaQuery.of(context).size.height * 2,
        child: Column(
          children: [
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 4),
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Colors.pinkAccent),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Text("Home",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Padding(
                      padding: const EdgeInsets.only( right: 20),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd",
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                        Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                                "Search...",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                        ),
        Padding(  padding: const EdgeInsets.only(right: 12.0),
            child:     Icon(Icons.search, color: Colors.grey),
        ),
          ]),
            ),

          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(12),
              ),
            child: IconButton(
              icon: Icon(Icons.apps_outlined, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )
                    ]

                ),
      ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.purple,
                      Colors.blue,
                    ],
                  ),
              borderRadius: BorderRadius.circular(12),
            ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 CachedNetworkImage(
                    imageUrl:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 14,
                itemBuilder: (ctx, index) {
                  return HorizontalCard();
                })
            ),
            SizedBox(
              height:20.0,
            ),
        Padding(  padding: const EdgeInsets.only(left: 20, right: 20),
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold)
                ),

                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, UserTimelinePage.routeName,
                    //     arguments: user.id);
                  },
                  child: Text(
                      "View All",
                      style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold)
                  ),
                ),
                  ],
            ),
    ),

            SizedBox(
              height: 20.0,
            ),

            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.5,
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 6/9,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: 26,
                  itemBuilder: (BuildContext ctx, index) {
                    return ProductCard();
                  }),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
