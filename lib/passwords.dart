import 'package:flutter/material.dart';

class Passwords extends StatelessWidget {
  final List<AccountModel> accounts = [
    new AccountModel(1, 'amazon.com', 'https://www.amazon.com/favicon.ico', [
      new PasswordDetailsModel(1, 1, 'username', 'password')
    ]),
    new AccountModel(2, 'americanexpress.com', 'https://www.americanexpress.com/favicon.ico', [
      new PasswordDetailsModel(2, 2, 'username', 'password')
    ]),
    new AccountModel(3, 'BestBuy', 'https://www.bestbuy.com/favicon.ico', [
      new PasswordDetailsModel(3, 3, 'username', 'password')
    ]),
    new AccountModel(4, 'github.com', 'https://www.github.com/favicon.ico', [
      new PasswordDetailsModel(4, 4, 'username', 'password')
    ]),
    new AccountModel(5, 'Google', 'https://www.google.com/favicon.ico', [
      new PasswordDetailsModel(5, 5, 'username', 'password'),
      new PasswordDetailsModel(6, 5, 'username', 'password'),
    ]),
    new AccountModel(6, 'grubhub.com', 'https://www.grubhub.com/favicon.ico', [
      new PasswordDetailsModel(7, 6, 'username', 'password')
    ]),
    new AccountModel(7, 'hertz.com', 'https://www.hertz.com/favicon.ico', [
      new PasswordDetailsModel(8, 7, 'username', 'password')
    ]),
    new AccountModel(8, 'Instagram', 'https://www.instagram.com/favicon.ico', [
      new PasswordDetailsModel(9, 8, 'username', 'password')
    ]),
    new AccountModel(9, 'Netflix', 'https://www.netflix.com/favicon.ico', [
      new PasswordDetailsModel(10, 9, 'username', 'password')
    ]),
    new AccountModel(10, 'Reddit', 'https://www.reddit.com/favicon.ico', [
      new PasswordDetailsModel(11, 10, 'username', 'password'),
      new PasswordDetailsModel(12, 10, 'username', 'password'),
    ]),
    new AccountModel(11, 'snapchat.com', 'https://www.snapchat.com/favicon.ico', [
      new PasswordDetailsModel(13, 11, 'username', 'password')
    ]),
    new AccountModel(12, 'target.com', 'https://www.target.com/favicon.ico', [
      new PasswordDetailsModel(14, 12, 'username', 'password')
    ]),
    new AccountModel(13, 'uber.com', 'https://www.uber.com/favicon.ico', [
      new PasswordDetailsModel(15, 13, 'username', 'password')
    ]),
    new AccountModel(14, 'usps.com', 'https://www.usps.com/favicon.ico', [
      new PasswordDetailsModel(16, 14, 'username', 'password')
    ]),
    new AccountModel(15, 'walmart.com', 'https://www.walmart.com/favicon.ico', [
      new PasswordDetailsModel(17, 15, 'username', 'password')
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return AccountWidget(accounts[index]);
        },
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  final AccountModel accountModel;

  AccountWidget(this.accountModel);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      leading: Padding(
        padding: EdgeInsets.all(10),
        child: Image.network(
          accountModel.iconUrl,
          fit: BoxFit.fill,
          alignment: Alignment.center,
          width: 30,
          height: 30,
        ),
      ),
      title: Text(accountModel.account),
      subtitle: accountModel.passwords.length > 1 ? Text(accountModel.passwords.length.toString() + ' Accounts') : null,
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountDetailsWidget(accountModel))
        )
      },
    );
  }
}

class AccountDetailsWidget extends StatelessWidget {
  final AccountModel accountModel;

  AccountDetailsWidget(this.accountModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(accountModel.id.toString()),
      ),
    );
  }
}

class AccountModel {
  final int id;
  final String account;
  final String iconUrl;
  final List<PasswordDetailsModel> passwords;

  AccountModel(this.id, this.account, this.iconUrl, this.passwords);

  @override
  String toString() {
    return '{id: $id, account: $account, iconUrl: $iconUrl, passwordCount: $passwords}';
  }
}

class PasswordDetailsModel {
  final int id;
  final int accountId;
  final String username;
  final String password;

  PasswordDetailsModel(this.id, this.accountId, this.username, this.password);

  @override
  String toString() {
    return '{id: $id, accountDetailsId: $accountId, username: $username, password: $password}';
  }
}
