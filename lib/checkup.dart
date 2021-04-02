import 'package:flutter/material.dart';

class Checkup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 10),
        child: ListTile(
          title: Text('checkup'),
        )
    );
  }
}
