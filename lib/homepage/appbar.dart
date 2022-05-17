import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Image.asset(
            "assets/head33.gif",
            fit: BoxFit.fill,
            width: 700,
            height: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/maakview.png',
                fit: BoxFit.cover,
                width: 150,
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
              elevation: 2,
              shape: CircleBorder(),
            ),
          ],
        ),
      ],
    ),
  );
}
