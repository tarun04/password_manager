import 'package:flutter/material.dart';
import 'package:password_manager/app.dart';
import 'package:password_manager/tabItem.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    required this.onSelectTab,
    required this.tabs,
  });

  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: tabs
          .map(
            (e) => _buildItem(
          index: e.getIndex(),
          icon: e.icon,
          tabName: e.tabName,
        ),
      ).toList(),
      onTap: (index) => onSelectTab(
        index,
      ),
      selectedItemColor: Colors.indigo[300],
      currentIndex: AppState.currentTab,
    );
  }

  BottomNavigationBarItem _buildItem(
      {required int index, required IconData icon, required String tabName}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: tabName,
    );
  }
}
