import 'package:flutter/material.dart';
import 'package:password_manager/entities/account.dart';
import 'package:password_manager/entities/password.dart';

class Passwords extends StatelessWidget {
  final List<Account> accounts = [
    new Account(1, 'amazon.com', 'https://www.amazon.com/favicon.ico', [
      new Password(1, 1, 'web', 'www.amazon.com', 'username', 'password')
    ]),
    new Account(2, 'americanexpress.com', 'https://www.americanexpress.com/favicon.ico', [
      new Password(2, 2, 'web', 'online.americanexpress.com', 'username', 'password')
    ]),
    new Account(3, 'BestBuy', 'https://www.bestbuy.com/favicon.ico', [
      new Password(3, 3, 'web', 'www.bestbuy.com', 'username', 'password')
    ]),
    new Account(4, 'github.com', 'https://www.github.com/favicon.ico', [
      new Password(4, 4, 'web', 'www.github.com', 'username', 'password')
    ]),
    new Account(5, 'Google', 'https://www.google.com/favicon.ico', [
      new Password(5, 5, 'web', 'www.google.com', 'username', 'password'),
      new Password(6, 5, 'app', 'Google', 'username', 'password'),
    ]),
    new Account(6, 'grubhub.com', 'https://www.grubhub.com/favicon.ico', [
      new Password(7, 6, 'app', 'GrubHub', 'username', 'password')
    ]),
    new Account(7, 'hertz.com', 'https://www.hertz.com/favicon.ico', [
      new Password(8, 7, 'web', 'www.hertz.com', 'username', 'password')
    ]),
    new Account(8, 'Instagram', 'https://www.instagram.com/favicon.ico', [
      new Password(9, 8, 'app', 'Instagram', 'username', 'password')
    ]),
    new Account(9, 'Netflix', 'https://www.netflix.com/favicon.ico', [
      new Password(10, 9, 'app', 'Netflix', 'username', 'password')
    ]),
    new Account(10, 'Reddit', 'https://www.reddit.com/favicon.ico', [
      new Password(11, 10, 'web', 'www.reddit.com', 'username', 'password'),
      new Password(12, 10, 'app', 'Reddit', 'username', 'password'),
    ]),
    new Account(11, 'snapchat.com', 'https://www.snapchat.com/favicon.ico', [
      new Password(13, 11, 'app', 'Snapchat', 'username', 'password')
    ]),
    new Account(12, 'target.com', 'https://www.target.com/favicon.ico', [
      new Password(14, 12, 'web', 'www.target.com', 'username', 'password')
    ]),
    new Account(13, 'uber.com', 'https://www.uber.com/favicon.ico', [
      new Password(15, 13, 'app', 'Uber', 'username', 'password')
    ]),
    new Account(14, 'usps.com', 'https://www.usps.com/favicon.ico', [
      new Password(16, 14, 'web', 'www.usps.com', 'username', 'password')
    ]),
    new Account(15, 'walmart.com', 'https://www.walmart.com/favicon.ico', [
      new Password(17, 15, 'web', 'www.walmart.com', 'username', 'password')
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return AccountWidget(accounts[index]);
            },
          ),
        )
    );
  }
}

class AccountWidget extends StatelessWidget {
  final Account account;

  AccountWidget(this.account);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(30, 5, 30, 5),
      leading: Padding(
        padding: EdgeInsets.all(10),
        child: Image.network(
          account.iconUrl,
          fit: BoxFit.fill,
          alignment: Alignment.center,
          width: 30,
          height: 30,
        ),
      ),
      title: Text(account.account),
      subtitle: account.passwords.length > 1 ? Text(account.passwords.length.toString() + ' Accounts') : null,
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountDetailsWidget(account))
        )
      },
    );
  }
}

class AccountDetailsWidget extends StatelessWidget {
  final Account account;

  AccountDetailsWidget(this.account);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      splashRadius: 17.5,
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.grey[800],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Image.network(
                      account.iconUrl,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(account.account)
                  ],
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[800],
                  height: 45,
                ),
                itemCount: account.passwords.length,
                itemBuilder: (context, index) {
                  return PasswordDetailsWidget(account.passwords[index]);
                },
                shrinkWrap: true,
              ),
            ],
          ),
        )
      ),
    );
  }
}

class PasswordDetailsWidget extends StatelessWidget {
  final Password password;

  PasswordDetailsWidget(this.password);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountTypeSection(password.type, password.typeName),
        UsernameSection(password.username),
        PasswordSection(password.password),
        ControlsSection()
      ],
    );
  }
}

class AccountTypeSection extends StatelessWidget {
  final String type;
  final String typeName;

  AccountTypeSection(this.type, this.typeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (type == 'web')
            Icon(Icons.language, color: Colors.grey[600],)
          else if (type == 'app')
            Icon(Icons.smartphone, color: Colors.grey[600],),
          SizedBox(
            width: 10,
          ),
          Text(typeName)
        ],
      ),
    );
  }
}

class UsernameSection extends StatelessWidget {
  final String username;

  UsernameSection(this.username);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: TextFormField(
        readOnly: true,
        initialValue: username,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(Icons.copy),
              color: Colors.grey[800],
              onPressed: () {}
          ),
          border: InputBorder.none,
          fillColor: Colors.indigo[50],
          filled: true,
          contentPadding: new EdgeInsets.symmetric(vertical: 17.5, horizontal: 15.0),
        ),
      ),
    );
  }
}

class PasswordSection extends StatelessWidget {
  final String password;

  PasswordSection(this.password);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: TextFormField(
        readOnly: true,
        initialValue: password,
        obscureText: true,
        decoration: InputDecoration(
          suffixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.visibility_off),
                  color: Colors.grey[800],
                  onPressed: () {}
              ),
              IconButton(
                  icon: Icon(Icons.copy),
                  color: Colors.grey[800],
                  onPressed: () {}
              ),
            ],
          ),
          border: InputBorder.none,
          fillColor: Colors.indigo[50],
          filled: true,
          contentPadding: new EdgeInsets.symmetric(vertical: 17.5, horizontal: 15.0),
        ),
      ),
    );
  }
}

class ControlsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 150,
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Edit'),
            ),
          ),
          SizedBox(
            width: 150,
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Delete'),
            ),
          )
        ],
      ),
    );
  }
}
