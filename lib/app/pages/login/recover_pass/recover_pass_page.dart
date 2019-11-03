import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/shared/components/button.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';

class RecoverPassPage extends StatefulWidget {
  @override
  _RecoverPassPageState createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {
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
                inputType: TextInputType.emailAddress),
            SizedBox(height: 10),
            Button(
                context: context, color: orange, text: "enviar", onTap: () {
                  CupertinoPageRoute(builder: (context) => HomeModule());
                })
          ],
        ),
      ),
    );
  }
}
