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
