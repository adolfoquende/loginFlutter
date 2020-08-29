import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sql.dart';

class Home extends StatefulWidget {
  String teste = '';

  Home(this.teste);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLogin = false;
  _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.teste),
              Image(
                width: 400,
                height: 400,
                image: AssetImage('assets/logo2.png'),
                alignment: Alignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
