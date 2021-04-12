import 'package:flutter/material.dart';

class AccountDetailsScreen extends StatelessWidget {
  static const route = '/account/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  splashRadius: 17.5,
                  icon: Icon(Icons.arrow_back_outlined),
                  color: Colors.grey[800],
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.all(17.5),
                ),
                Expanded(
                  child: ListTile(
                    leading: FlutterLogo(size: 30.0,),
                    title: Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListTile(
                        leading: Icon(Icons.language, color: Colors.grey[600],),
                        title: Text('test'),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: TextFormField(
                          readOnly: true,
                          initialValue: 'username',
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
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        child: TextFormField(
                          readOnly: true,
                          initialValue: 'password',
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
                      ),
                      Container(
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
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[800],
                  height: 45,
                ),
                itemCount: 2,
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              ),
            ),
          ],
        ),
      )
    );
  }
}
