import 'package:flutter/material.dart';
import 'package:password_manager/providers/navigation_provider.dart';
import 'package:password_manager/screens/account_details_screen.dart';
import 'package:password_manager/widgets/search_widget.dart';

class AccountsScreen extends StatefulWidget {
  static const route = '/accounts';

  AccountsScreen({Key? key}) : super(key: key);

  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: SearchWidget(),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              pinned: false,
              elevation: 0.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.all(10),
                      child: FlutterLogo(size: 30.0,),
                    ),
                    title: Text('Account $index'),
                    subtitle: index % 2 == 1 ? Text('2 Accounts') : null,
                    contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamed(AccountDetailsScreen.route);
                    },
                  ),
                ),
                childCount: 10,
              ),
            ),
          ],
          controller: NavigationProvider.of(context)
              .screens[ACCOUNTS_SCREEN]
              .scrollController,
        ),
      ),
    );
  }
}
