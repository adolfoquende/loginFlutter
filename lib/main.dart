import 'file:///D:/Projectos/Flutter/FlutterChallenge/lib/Ecommerce/pages/register_page.dart';
import 'package:FlutterChallenge/Ecommerce/screens/home_ecomerce.dart';
import 'package:FlutterChallenge/TodoWithSQLITE/screens/note_detail.dart';
import 'package:FlutterChallenge/TodoWithSQLITE/screens/note_list.dart';
import 'package:FlutterChallenge/screens/BottomNavigationBar.dart';
import 'package:FlutterChallenge/screens/Home.dart';
import 'package:flutter/material.dart';
import 'Calculadora/screens/calculator.dart';
import 'Challenges/CurvedNavigation.dart';
import 'Challenges/Login/LoginBasic.dart';

void main() {
  runApp(HomeEcomerce());
}

class App extends StatelessWidget {
  // This widget is the root of yur application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Challenge', home: RegisterPage());
  }
}
