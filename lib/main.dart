import 'package:flutter/material.dart';
import 'package:unasp_ht/src/login/login-widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Flexo'),
      debugShowCheckedModeBanner: false,
      title: 'UNASP-HT',
      home: LoginWidget(),
    );
  }
}