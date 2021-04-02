import 'package:flutter/material.dart';
import 'package:password_manager/checkup.dart';
import 'package:password_manager/passwords.dart';
import 'package:password_manager/settings.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Passwords(),
    Checkup(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings_sharp),
            label: 'Checkup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Passwords',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.indigo[300],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
