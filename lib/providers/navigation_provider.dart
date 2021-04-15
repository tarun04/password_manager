import 'package:flutter/material.dart';
import 'package:password_manager/models/screen.dart';
import 'package:password_manager/screens/account_details_screen.dart';
import 'package:password_manager/screens/accounts_screen.dart';
import 'package:password_manager/screens/checkup_screen.dart';
import 'package:password_manager/screens/root.dart';
import 'package:password_manager/screens/settings_screen.dart';
import 'package:provider/provider.dart';

const ACCOUNTS_SCREEN = 0;
const CHECKUP_SCREEN = 1;

class NavigationProvider extends ChangeNotifier {
  static NavigationProvider of(BuildContext context) =>
      Provider.of<NavigationProvider>(context, listen: false);

  int _currentScreenIndex = ACCOUNTS_SCREEN;

  int get currentTabIndex => _currentScreenIndex;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('Generating route: ${settings.name}');
    switch (settings.name) {
      case AccountDetailsScreen.route:
        return MaterialPageRoute(builder: (_) => AccountDetailsScreen());
      case SettingsScreen.route:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => Root());
    }
  }

  final Map<int, Screen> _screens = {
    ACCOUNTS_SCREEN: Screen(
      title: 'Passwords',
      child: AccountsScreen(),
      icon: Icon(Icons.home),
      initialRoute: AccountsScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating route: ${settings.name}');
        switch (settings.name) {
          case AccountDetailsScreen.route:
            return MaterialPageRoute(builder: (_) => AccountDetailsScreen());
          case SettingsScreen.route:
            return MaterialPageRoute(builder: (_) => SettingsScreen());
          default:
            return MaterialPageRoute(builder: (_) => AccountsScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    CHECKUP_SCREEN: Screen(
      title: 'Checkup',
      child: CheckupScreen(),
      icon: Icon(Icons.admin_panel_settings),
      initialRoute: CheckupScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        print('Generating route: ${settings.name}');
        switch (settings.name) {
          default:
            return MaterialPageRoute(builder: (_) => CheckupScreen());
        }
      },
      scrollController: ScrollController(),
    ),
  };

  List<Screen> get screens => _screens.values.toList();

  Screen? get currentScreen => _screens[_currentScreenIndex];

  void setTab(int tab) {
    if (tab == currentTabIndex) {
      _scrollToStart();
    }
    else {
      _currentScreenIndex = tab;
      notifyListeners();
    }
  }

  void _scrollToStart() {
    currentScreen!.scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Future<bool> onWillPop() async {
    final currentNavigatorState = currentScreen!.navigatorState.currentState;

    if (currentNavigatorState!.canPop()) {
      currentNavigatorState.pop();
      return false;
    }
    else {
      if (currentTabIndex != ACCOUNTS_SCREEN) {
        setTab(ACCOUNTS_SCREEN);
        notifyListeners();
        return false;
      }
      else {
        return true;
      }
    }
  }
}
