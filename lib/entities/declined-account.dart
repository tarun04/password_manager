class DeclinedAccount {
  final int id;
  final String account;
  final String iconUrl;

  DeclinedAccount(this.id, this.account, this.iconUrl);

  @override
  String toString() {
    return '{id: $id, account: $account, iconUrl: $iconUrl}';
  }
}

getDeclinedAccounts() {
  var sites = [
    new DeclinedAccount(1, 'udemy.com', 'https://www.udemy.com/favicon.ico'),
    new DeclinedAccount(2, 'ups.com', 'https://www.ups.com/favicon.ico'),
  ];

  return sites;
}
