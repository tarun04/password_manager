import 'package:flutter/material.dart';
import 'package:password_manager/screens/settings_screen.dart';

class AccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey[800],
                  onPressed: () {},
                ),
                title: Center(
                  child: Text(
                    'Google',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0),
                  )
                ),
                trailing: Icon(Icons.close, color: Colors.transparent,),
              ),
              ListTile(
                leading: Padding(
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 48.0,
                  ),
                  padding: EdgeInsets.all(5.0),
                ),
                title: Text('John Doe'),
                subtitle: Text('john.doe@gmail.com'),
                trailing: IconButton(
                  icon: Icon(Icons.expand_more),
                  color: Colors.grey.shade800,
                  onPressed: () {},
                ),
              ),
              Center(
                child: OutlinedButton(
                  child: Text('Manage your Google Account'),
                  onPressed: () {  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.grey[800],
                  onPressed: () { },
                ),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(SettingsScreen.route);
                },
              ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.help_outline),
                  color: Colors.grey[800],
                  onPressed: () {},
                ),
                title: Text('Help & Feedback'),
              ),
              Divider(
                thickness: 1.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.circle, size: 5.0,),
                  ),
                  TextButton(
                    child: Text(
                      'Terms of Service',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade800),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
