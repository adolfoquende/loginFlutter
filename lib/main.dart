import 'package:FlutterChallenge/screens/BottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'Calculadora/screens/calculator.dart';
import 'Challenges/CurvedNavigation.dart';

void main() {
  runApp(NavigationBarBeautifull());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge',
      home: CurvedNavigationApp(),
    );
  }
}
