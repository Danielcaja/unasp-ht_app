import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/src/components/button.dart';
import 'package:unasp_ht/src/components/text-field.dart';
import 'package:unasp_ht/src/forget-password/forget-password-widget.dart';
import 'package:unasp_ht/src/home/home-widget.dart';
import 'package:unasp_ht/src/signup/signup-widget.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  _forgetPass() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ForgetPasswordWidget()));
  }

  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    Color blue = Theme.of(context).primaryColor;
    double appWidth = MediaQuery.of(context).size.width;

    _signIn() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeWidget()));
    }

    _forgetPass() {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ForgetPasswordWidget()));
    }

    _signUp() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignupWidget()));
    }

    return Scaffold(
      backgroundColor: blue,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: appWidth * .1, right: appWidth * .1),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: appWidth * .3,
                ),
                Image.asset(
                  "assets/img/logo_branco.png",
                  width: 180,
                ),
                SizedBox(
                  height: appWidth * 0.2,
                ),
                CustomTextField(
                  hintText: "Email",
                  icon: FontAwesomeIcons.solidEnvelope,
                  isPassword: false,
                  isBlue: true,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Senha",
                  icon: FontAwesomeIcons.lock,
                  isPassword: true,
                  isBlue: true,
                ),
                SizedBox(
                  height: 30,
                ),
                Button(
                    context: context,
                    color: orange,
                    text: "entrar",
                    onTap: _signIn),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: _signUp,
                        child: Text(
                          "Cadastre-se".toUpperCase(),
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Text("   |   ",
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      GestureDetector(
                        onTap: _forgetPass,
                        child: Text(
                          "Esqueci minha senha".toUpperCase(),
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
