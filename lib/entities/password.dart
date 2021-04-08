class Password {
  final int id;
  final int accountId;
  final String type;
  final String typeName;
  final String username;
  final String password;

  Password(this.id, this.accountId, this.type, this.typeName, this.username, this.password);

  @override
  String toString() {
    return '{id: $id, accountDetailsId: $accountId, type: $type, typeName: $typeName, username: $username, password: $password}';
  }
}

getCompromisedPasswords() {
  var passwords = <Password>[];

  return passwords;
}

getReusedPasswords() {
  var passwords = <Password>[
    new Password(10, 9, 'app', 'Netflix', 'username', 'password'),
    new Password(15, 13, 'app', 'Uber', 'username', 'password'),
  ];

  return passwords;
}

getWeakPasswords() {
  var passwords = <Password>[
    new Password(7, 6, 'app', 'GrubHub', 'username', 'password'),
    new Password(13, 11, 'app', 'Snapchat', 'username', 'password')
  ];

  return passwords;
}
