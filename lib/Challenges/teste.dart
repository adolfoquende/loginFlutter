import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'Challenges/CurvedNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CurvedNavigationApp(),
    );
  }
}

class CurvedNavigationApp extends StatefulWidget {
  @override
  _CurvedNavigationAppState createState() => _CurvedNavigationAppState();
}

class _CurvedNavigationAppState extends State<CurvedNavigationApp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Flutter Challenge",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.deepOrange,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "This is just test of Curved Navigation Bar",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.verified_user,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.add,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.list,
            size: 20,
            color: Colors.black,
          )
        ],
        onTap: (index) {
          debugPrint("Current Index is $index");
        },
      ),
    );
  }
}
