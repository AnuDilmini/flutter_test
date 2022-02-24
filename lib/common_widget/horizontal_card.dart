import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatelessWidget {

  HorizontalCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.only( right: 10),
        padding: EdgeInsets.symmetric( horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 5,
              blurRadius: 50,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Padding(
        padding: const EdgeInsets.only(left: 12.0, top: 8.0),
        child: CachedNetworkImage(
              imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSr-iFW5W8n3_jxNKiclAP_k71Fi9PGcojsMUC-vb8zbwJthbBd",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
        ),
            SizedBox(
              width: 3.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 10),
                child: Text(
                  "Sports Shoes",
                  style: TextStyle(
                    fontSize: 8.0,
                    color: Colors.black,
                  ),
                ),),
          ],
        ),
      ),
    );
  }
}
