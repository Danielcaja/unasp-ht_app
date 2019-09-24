import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/src/components/button.dart';
import 'package:unasp_ht/src/components/text-field.dart';

class SignupWidget extends StatefulWidget {
  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
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
              Button(color: orange, onTap: (){}, context: context, text: "Continuar"),
            ],
          ),
        ),
      ),
    );
  }
}
