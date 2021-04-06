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
