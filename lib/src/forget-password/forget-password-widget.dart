import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/src/components/button.dart';
import 'package:unasp_ht/src/components/text-field.dart';

class ForgetPasswordWidget extends StatefulWidget {
  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: Text("Esqueci minha senha".toUpperCase())),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: <Widget>[
            CustomTextField(
              hintText: "Email",
              icon: FontAwesomeIcons.solidEnvelope,
              isPassword: false,
              isBlue: false,
            ),
            SizedBox(height: 10),
            Button(
                context: context, color: orange, text: "enviar", onTap: () {})
          ],
        ),
      ),
    );
  }
}
