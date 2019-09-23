import 'package:flutter/material.dart';

class SignupWidget extends StatefulWidget {
  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastro".toUpperCase()),
      ),
      body: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}
