import '../screens/label1.dart';
import '../screens/label2.dart';
import '../screens/label3.dart';
import '../screens/label4.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatefulWidget {
  static const routeName = '/bottom-tab-bar';
  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': LabelOne(), 'title': 'ARK - Funds'},
      {'page': LabelTwo(), 'title': 'Label 2'},
      {'page': LabelThree(), 'title': 'Label 3'},
      {'page': LabelFour(), 'title': 'Label 4'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
        ),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blueGrey,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
              icon: Icon(Icons.circle),
              title: Text(_pages[_selectedPageIndex]['title']),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
              icon: Icon(Icons.circle),
              title: Text(_pages[_selectedPageIndex]['title']),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
              icon: Icon(Icons.circle),
              title: Text(_pages[_selectedPageIndex]['title']),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(248, 248, 248, 0.92),
              icon: Icon(Icons.circle),
              title: Text(_pages[_selectedPageIndex]['title']),
            ),
          ],
        ));
  }
}
