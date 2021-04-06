import 'package:flutter/material.dart';
import 'package:password_manager/components/checkup.dart';
import 'package:password_manager/components/passwords.dart';
import 'package:password_manager/components/settings.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  // this is static property so other widget throughout the app
  // can access it simply by AppState.currentTab
  static int currentTab = 1;

  final List<Widget> tabs = [
    Checkup(),
    Passwords(),
    Settings()
  ];

  AppState();

  // sets current tab index and update state
  void _selectTab(int index) {
    setState(() => currentTab = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        currentIndex: currentTab,
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
}
