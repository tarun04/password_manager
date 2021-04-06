import 'package:password_manager/entities/password.dart';

class Account {
  final int id;
  final String account;
  final String iconUrl;
  final List<Password> passwords;

  Account(this.id, this.account, this.iconUrl, this.passwords);

  @override
  String toString() {
    return '{id: $id, account: $account, iconUrl: $iconUrl, passwordCount: $passwords}';
  }
}

getAccounts() {
  var accounts = [
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

  return accounts;
}
