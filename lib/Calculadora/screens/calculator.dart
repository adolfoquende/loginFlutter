import 'package:FlutterChallenge/Calculadora/componentes/display.dart';
import 'package:FlutterChallenge/Calculadora/componentes/keyboad.dart';
import 'package:FlutterChallenge/Calculadora/models/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  _onPressed(String text) {
    // print(text);
    setState(() {
      memory.applyCommand(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp //Para predefinir a orientacao do dispositivo
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Column(
          children: <Widget>[Display(memory.value), Keyboard(_onPressed)],
        ));
  }
}
