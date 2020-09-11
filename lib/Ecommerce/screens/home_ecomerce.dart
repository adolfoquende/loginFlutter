import 'package:FlutterChallenge/Ecommerce/pages/register_page.dart';
import 'package:flutter/material.dart';

class HomeEcomerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARDEVS',
      theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.deepOrange[200],
          textTheme: TextTheme(
              title: TextStyle(fontSize: 72.0),
              body1: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              headline:
                  TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold))),
      // home: HomePage(),
      home: RegisterPage(),
    );
  }
}
