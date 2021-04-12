import 'package:flutter/material.dart';
import 'package:password_manager/providers/navigation_provider.dart';
import 'package:password_manager/screens/account_details_screen.dart';

class AccountsScreen extends StatelessWidget {
  static const route = '/accounts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          controller: NavigationProvider.of(context)
              .screens[ACCOUNTS_SCREEN]
              .scrollController,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Padding(
                padding: EdgeInsets.all(10),
                child: FlutterLogo(size: 30.0,),
              ),
              title: Text('Account $index'),
              subtitle: index % 2 == 1 ? Text('2 Accounts') : null,
              contentPadding: EdgeInsets.fromLTRB(30, 15, 30, 15),
              onTap: () {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamed(AccountDetailsScreen.route);
              },
            );
          }
        ),
      )
    );
  }
}
