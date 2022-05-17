import 'package:flutter/material.dart';
import 'package:maakview/homepage/appbar.dart';

import 'homepage/body.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: (MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  final screens = [
    MyApp(),
    Center(
      child: Text('Categories'),
    ),
    Center(
      child: Text('Chat'),
    ),
    Center(
      child: Text('Massage'),
    ),
    Center(
      child: Text('Shopping'),
    ),
    Center(
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: buildAppBar(),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                //color: Colors.grey,
              ),
              label: 'Home',
              backgroundColor: Colors.deepPurpleAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Home',
              backgroundColor: Colors.yellow),
        ],
      ),
    );
  }
}
