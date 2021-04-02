import 'package:flutter/material.dart';
import 'package:password_manager/app.dart';
import 'package:password_manager/passwords.dart';

class TabItem {
  TabItem({
    required this.tabName,
    required this.icon,
    required Widget page,
    required index,
  }) {
    _page = page;
    _index = index;
  }

  final String tabName;
  final IconData icon;
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  int _index = 1;
  Widget _page = Passwords();

  int getIndex() => _index;

  // adds a wrapper around the page widgets for visibility
  // visibility widget removes unnecessary problems
  // like interactivity and animations when the page is inactive
  Widget get page {
    return Visibility(
      // only paint this page when currentTab is active
      visible: _index == AppState.currentTab,
      // important to preserve state while switching between tabs
      maintainState: true,
      child: Navigator(
        key: key,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (_) => _page,
          );
        },
      ),
    );
  }
}
