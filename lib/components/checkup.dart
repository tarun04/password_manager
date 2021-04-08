import 'package:flutter/material.dart';
import 'package:password_manager/entities/account.dart';
import 'package:password_manager/entities/password.dart';

class Checkup extends StatelessWidget {
  final List<Account> accounts = getAccounts();
  final List<Password> compromisedPasswords = getCompromisedPasswords();
  final List<Password> reusedPasswords = getReusedPasswords();
  final List<Password> weakPasswords = getWeakPasswords();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
              child: Image(
                image: compromisedPasswords.length > 0 ? AssetImage('assets/images/password_checkup_scene_red_2019_10_24.png')
                        : reusedPasswords.length > 0 || weakPasswords.length > 0
                        ? AssetImage('assets/images/password_checkup_scene_yellow_2019_10_24.png')
                        : AssetImage('assets/images/password_checkup_scene_green_2019_10_24.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Center(
                child: Text('Passwords checked for ' + accounts.length.toString() +
                    (accounts.length > 1 ? ' sites and apps' : ' site or app')),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: ExpansionPanelList(
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        child: ListTile(
                          leading: Padding(
                            padding: EdgeInsets.all(7.5),
                            child: Icon(
                              compromisedPasswords.length > 0 ? Icons.dangerous : Icons.check_circle,
                              color: compromisedPasswords.length > 0 ? Colors.red : Colors.green,
                            ),
                          ),
                          title: compromisedPasswords.length > 0
                              ? Text(compromisedPasswords.length.toString() + ' compromised passwords')
                              : Text('No compromised passwords'),
                        ),
                      );
                    },
                    body: Center(
                      child: Text('Based on our information, none of your'
                          'saved passwords are compromised'),
                    ),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        child: ListTile(
                          leading: Padding(
                            padding: EdgeInsets.all(7.5),
                            child: Icon(
                              reusedPasswords.length > 0 ? Icons.error : Icons.check_circle,
                              color: reusedPasswords.length > 0 ? Colors.yellow.shade700 : Colors.green,
                            ),
                          ),
                          title: reusedPasswords.length > 0
                              ? Text(reusedPasswords.length.toString() + ' reused passwords')
                              : Text('No reused passwords'),
                          subtitle: Text('Create unique passwords'),
                        ),
                      );
                    },
                    body: Center(
                      child: Text('Create unique passwords'),
                    ),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        child: ListTile(
                          leading: Padding(
                            padding: EdgeInsets.all(7.5),
                            child: Icon(
                              weakPasswords.length > 0 ? Icons.error : Icons.check_circle,
                              color: weakPasswords.length > 0 ? Colors.yellow.shade700 : Colors.green,
                            ),
                          ),
                          title: weakPasswords.length > 0
                              ? Text(weakPasswords.length.toString() + ' accounts using weak password')
                              : Text('No weak passwords'),
                          subtitle: Text('Create strong passwords'),
                        ),
                      );
                    },
                    body: Center(
                      child: Text('Create strong passwords'),
                    ),
                    isExpanded: false,
                  ),
                ],
                elevation: 0,
              ),
            ),
          ],
        ),
      )
    );
  }
}

class CompromisedPasswordsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
