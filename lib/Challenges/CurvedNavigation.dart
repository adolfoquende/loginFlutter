import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavigationApp extends StatefulWidget {
  @override
  _CurvedNavigationAppState createState() => _CurvedNavigationAppState();
}

class _CurvedNavigationAppState extends State<CurvedNavigationApp> {
  @override
  Widget build(BuildContext context) {
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
              "Eu chegarei a maestria",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 2, //Para aonde a selecao ficara quando o App iniciar
        animationDuration: Duration(milliseconds: 200), //Para definir a duracao
        color: Colors.white,
        backgroundColor: Colors.deepOrange,
        buttonBackgroundColor: Colors.white,
        items: <Widget>[
          //Define o que serao como icones
          Icon(
            Icons.verified_user,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.exit_to_app,
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
