import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/src/home/home-widget.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    Color blue = Theme.of(context).primaryColor;
    double appWidth = MediaQuery.of(context).size.width;

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
                _textField("Email", FontAwesomeIcons.userAlt, false),
                SizedBox(
                  height: 20,
                ),
                _textField("Senha", FontAwesomeIcons.lock, true),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeWidget()));
                  },
                  child: Container(
                    height: 55,
                    // width: ,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        color: orange,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Text(
                        "Entrar".toUpperCase(),
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: Text(
                    "Cadastre-se   |   Esqueci Minha Senha".toUpperCase(),
                    style: TextStyle(fontSize: 14, color: Colors.white),
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

Widget _textField(String hintText, IconData icon, bool isPassword) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
    decoration: BoxDecoration(
        color: Color(0xFF374562),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: TextField(
      keyboardType:
          isPassword ? TextInputType.text : TextInputType.emailAddress,
      obscureText: isPassword,
      style: TextStyle(fontSize: 14, color: Color(0xFFC2C2C2)),
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Color(0xFFC2C2C2), fontSize: 14),
          hintText: hintText.toUpperCase(),
          icon: IconTheme(
            data: IconThemeData(color: Color(0xFFC2C2C2)),
            child: Icon(icon),
          ),
          border: InputBorder.none),
    ),
  );
}
