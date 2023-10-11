import 'package:flutter/material.dart';
import 'package:la_nation/screens/home/tab_holder.dart';
import 'package:la_nation/screens/search/search.dart';
import '../../constants/colors.dart' as app_color;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTabIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    TabHolder(),
    Search(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: app_color.lightBackground,
      body: Center(
        child: _widgetOptions.elementAt(_selectedTabIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/tab1w.png')),
            label: 'A la une',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Journal',
          ),
        ],
        currentIndex: _selectedTabIndex,
        selectedItemColor: app_color.link,
        unselectedItemColor: app_color.white,
        backgroundColor: app_color.primary,
        iconSize: screenWidth * 0.06,
        onTap: onTabTapped,
      ),
    );
  }
}
