import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/shared/constants.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNASP HT',
      theme: ThemeData(
        fontFamily: 'Flexo',
        secondaryHeaderColor: ORANGE,
        primaryColor: BLUE,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginModule(),
    );
  }
}