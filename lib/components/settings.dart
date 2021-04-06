import 'package:flutter/material.dart';
import 'package:password_manager/entities/declined-account.dart';

class Settings extends StatelessWidget {
  final List<DeclinedAccount> accounts = getDeclinedAccounts();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SavePasswords(),
            AutoSignIn(),
            ExportPasswords(),
            ImportPasswords(),
            SizedBox(
              height: 10,
            ),
            DeclinedSection(accounts),
          ],
        )
      )
    );
  }
}

class SavePasswords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(25, 25, 25, 5),
      title: Text('Offer to save passwords'),
      subtitle: Text('Offer to save passwords in Android and Chrome'),
      trailing: Switch(
        value: false,
        onChanged: (bool value) {},
      ),
    );
  }
}

class AutoSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(25, 5, 25, 5),
      title: Text('Auto sign-in'),
      subtitle: Text('Automatically sign in to websites using stored'
          'credentials. If disabled, you will be asked for confirmation every '
          'time before signing in to a website. Learn more'),
      trailing: Switch(
        value: true,
        onChanged: (bool value) {},
      ),
    );
  }
}

class ExportPasswords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(25, 5, 25, 5),
      title: Text('Export passwords'),
      subtitle: Text('Download a copy of your passwords to use with another service'),
      trailing: IconButton(
        icon: Icon(Icons.file_upload),
        color: Colors.blueAccent,
        onPressed: () {},
      ),
    );
  }
}

class ImportPasswords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(25, 5, 25, 5),
      title: Text('Import passwords'),
      subtitle: Text('To import passwords to your Google Account, select a CSV file'),
      trailing: IconButton(
        icon: Icon(Icons.file_download),
        color: Colors.blueAccent,
        onPressed: () {},
      ),
    );
  }
}

class DeclinedSection extends StatelessWidget {
  final List<DeclinedAccount> accounts;

  DeclinedSection(this.accounts);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        width: MediaQuery.of(context).size.width - 25,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.all(Radius.circular(7.5)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(accounts.length.toString() + ' declined '+ (accounts.length > 1 ? 'sites and apps' : 'site or app')),
              subtitle: Text('You\'ve chosen not to save passwords for these sites '
                  'and apps. Learn more'),
            ),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
                height: 10,
                indent: 65,
              ),
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return SiteWidget(accounts[index]);
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
      fit: BoxFit.fill,
    );
  }
}

class SiteWidget extends StatelessWidget {
  final DeclinedAccount account;

  SiteWidget(this.account);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        account.iconUrl,
        fit: BoxFit.fill,
        alignment: Alignment.center,
        width: 25,
        height: 25,
      ),
      title: Text(account.account),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      ),
    );
  }
}
