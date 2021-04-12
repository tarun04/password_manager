import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckupScreen extends StatelessWidget {
  static const route = '/checkup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                        child: Image(
                          image: AssetImage('assets/images/password_checkup_scene_yellow_2019_10_24.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Center(
                          child: Text('Passwords checked for 10 sites and apps'),
                        ),
                      ),
                      ExpansionPanelList(
                        children: [
                          ExpansionPanel(
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return ListTile(
                                leading: Padding(
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  padding: EdgeInsets.all(7.5),
                                ),
                                title: Text('No compromised passwords'),
                              );
                            },
                            body: Text('Based on our information, none of your'
                                'saved passwords are compromised'),
                            isExpanded: false,
                          ),
                          ExpansionPanel(
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return ListTile(
                                leading: Padding(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.yellow.shade700,
                                  ),
                                  padding: EdgeInsets.all(7.5),
                                ),
                                title: Text('5 reused passwords'),
                                subtitle: Text('Create unique passwords'),
                              );
                            },
                            body: Text('Create unique passwords'),
                            isExpanded: false,
                          ),
                          ExpansionPanel(
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return ListTile(
                                leading: Padding(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.yellow.shade700,
                                  ),
                                  padding: EdgeInsets.all(7.5),
                                ),
                                title: Text('2 accounts using weak password'),
                                subtitle: Text('Create strong passwords'),
                              );
                            },
                            body: Text('Create strong passwords'),
                            isExpanded: false,
                          ),
                        ],
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        )
    );
  }
}
