import 'package:flutter/material.dart';
import 'package:password_manager/bottomNavigation.dart';
import 'package:password_manager/checkup.dart';
import 'package:password_manager/passwords.dart';
import 'package:password_manager/settings.dart';
import 'package:password_manager/tabItem.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  // this is static property so other widget throughout the app
  // can access it simply by AppState.currentTab
  static int currentTab = 1;

  final List<TabItem> tabs = [
    TabItem(
      tabName: "Checkup",
      icon: Icons.admin_panel_settings_sharp,
      page: Checkup(),
      index: 0
    ),
    TabItem(
      tabName: "Passwords",
      icon: Icons.home,
      page: Passwords(),
      index: 1
    ),
    TabItem(
      tabName: "Settings",
      icon: Icons.settings,
      page: Settings(),
      index: 2
    ),
  ];

  AppState();

  // sets current tab index and update state
  void _selectTab(int index) {
    if (index == currentTab) {
      // pop to first route
      // if the user taps on the active tab
      tabs[index].key.currentState!.popUntil((route) => route.isFirst);
    } else {
      // update the state
      // in order to repaint
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope handle android back btn
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await tabs[currentTab].key.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != 1) {
            // select 'main' tab
            _selectTab(1);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },

      child: Scaffold(
        // indexed stack shows only one child
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((e) => e.page).toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          onSelectTab: _selectTab,
          tabs: tabs,
        ),
      ),
    );
  }
}
