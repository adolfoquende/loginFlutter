import 'package:FlutterChallenge/Calculadora/componentes/display.dart';
import 'package:flutter/material.dart';


class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Column(
      children: <Widget>[Display('1234.3'), Text("Teclado")],
    ));
  }
}
