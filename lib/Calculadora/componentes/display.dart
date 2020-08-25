 import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String text;
  Display(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        //Para pegar toda tela
        flex: 1,
        child: Container(
            color: Color.fromRGBO(48, 48, 48, 1),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // Para ocupar a coluna inteira
              mainAxisAlignment:
                  MainAxisAlignment.end, // Para por o texto no final
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      text,
                      minFontSize: 20,
                      maxFontSize: 80,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          decoration: TextDecoration.none,
                          fontSize: 80,
                          color: Colors.white),
                    ))
              ],
            )));
  }
}
