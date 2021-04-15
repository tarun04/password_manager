import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const route = '/settings';

  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.grey.shade800,),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Text(
                          'Settings',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.grey.shade800)
                      ),
                    ),
                  ),
                  SizedBox(width: 25.0,)
                ],
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              pinned: true,
              elevation: 0.0,
              automaticallyImplyLeading: false,
            ),
            SliverList(
              delegate: new SliverChildListDelegate([
                SavePasswords(),
                AutoSignIn(),
                ExportPasswords(),
                ImportPasswords(),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: DeclinedSection(),
                ),
              ])
            )
          ],
        ),
      ),
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
              title: Text('5 declined sites and apps'),
              subtitle: Text('You\'ve chosen not to save passwords for these sites '
                  'and apps. Learn more'),
            ),
            ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
                height: 10,
                indent: 75,
              ),
              itemCount: 5,
              itemBuilder: (context, index) {
                return SiteWidget();
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
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.all(10),
        child: FlutterLogo(size: 30.0,),
      ),
      title: Text('Flutter'),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      ),
    );
  }
}
