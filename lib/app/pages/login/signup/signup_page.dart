import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/shared/components/button.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cadastro".toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: <Widget>[
              CustomTextField(
                isBlue: false,
                icon: FontAwesomeIcons.userAlt,
                hintText: "nome",
                isPassword: false,
                inputType: TextInputType.text,
              ),
              SizedBox(height: 10),
              CustomTextField(
                isBlue: false,
                icon: FontAwesomeIcons.solidEnvelope,
                hintText: "email",
                isPassword: false,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              CustomTextField(
                isBlue: false,
                icon: FontAwesomeIcons.lock,
                hintText: "senha",
                isPassword: true,
                inputType: TextInputType.text,
              ),
              SizedBox(height: 10),
              CustomTextField(
                isBlue: false,
                icon: FontAwesomeIcons.lock,
                hintText: "confirmação de senha",
                isPassword: true,
                inputType: TextInputType.text,
              ),
              SizedBox(height: 20),
              Button(
                  color: orange,
                  onTap: () {
                    CupertinoPageRoute(builder: (context) => HomeModule());
                  },
                  context: context,
                  text: "Continuar"),
            ],
          ),
        ),
      ),
    );
  }
}
