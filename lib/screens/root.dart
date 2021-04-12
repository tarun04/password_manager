import 'package:flutter/material.dart';
import 'package:password_manager/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        final bottomNavigationBarItems = provider.screens.map((screen) =>
          BottomNavigationBarItem(
              icon: screen.icon,
              label: screen.title
          ),
        ).toList();

        final screens = provider.screens.map((screen) =>
          TickerMode(
            enabled: screen == provider.currentScreen,
            child: Offstage(
              offstage: screen != provider.currentScreen,
              child: Navigator(
                key: screen.navigatorState,
                onGenerateRoute: screen.onGenerateRoute,
              ),
            ),
          ),
        ).toList();

        return WillPopScope(
          onWillPop: provider.onWillPop,
          child: Scaffold(
            body: IndexedStack(
              children: screens,
              index: provider.currentTabIndex,
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavigationBarItems,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
            ),
          ),
        );
      },
    );
  }
}
