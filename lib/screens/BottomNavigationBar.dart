import 'package:FlutterChallenge/Calculadora/screens/calculator.dart';
import 'package:FlutterChallenge/Challenges/LoginBasic.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

class NavigationBarBeautifull extends StatefulWidget {
  @override
  _NavigationBarBeautifullState createState() =>
      _NavigationBarBeautifullState();
}

class _NavigationBarBeautifullState extends State<NavigationBarBeautifull> {
  int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*appBar: AppBar(
          title: Text('VIPAS'),
          centerTitle: true,
        ),*/
        backgroundColor: Colors.grey[1],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          opacity: 0.2,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          currentIndex: currentIndex,
          hasInk: true,
          inkColor: Colors.black12,
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          onTap: changePage,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.dashboard,
                  color: Colors.red,
                ),
                title: Text('Home')),
            BubbleBottomBarItem(
                backgroundColor: Colors.purple,
                icon: Icon(
                  Icons.folder,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.dashboard,
                  color: Colors.purple,
                ),
                title: Text('Home')),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.queue_music,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.queue_music,
                  color: Colors.green,
                ),
                title: Text('Home')),
          ],
        ),
        body: (currentIndex == 0)
            ? Calculator()
            : (currentIndex == 1)
                ? LoginPage()
                : (currentIndex == 2) ? null : null,
      ),
    );
  }
}
