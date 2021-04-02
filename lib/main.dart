import 'package:flutter/material.dart';
import 'package:password_manager/app.dart';

void main() => runApp(MyApp());

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google password manager',
      home: App()
    );
  }
}
