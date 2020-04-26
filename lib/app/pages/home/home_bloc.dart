import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';

class HomeBloc extends BlocBase {
  void signOut(BuildContext context) {
    Navigator.of(context)
        .pushReplacement<CupertinoPageRoute, CupertinoPageRoute>(
            CupertinoPageRoute(builder: (context) => LoginModule()));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
