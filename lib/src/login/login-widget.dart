import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2D50),
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(left: 40, right: 40),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 180,
            ),
            Image.asset(
              "assets/img/logo_branco.png",
              width: 180,
            ),
            SizedBox(
              height: 80,
            ),
            _textField("Email", Icons.person, false),
            SizedBox(
              height: 20,
            ),
            _textField("Senha", Icons.lock, true),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              // width: ,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                  color: Color(0xFFFF4C00),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  "Entrar".toUpperCase(),
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Esqueci minha senha".toUpperCase(),
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            Expanded(
              child: new Align(
                alignment: Alignment.bottomCenter,
                child: new Text("Cadastro".toUpperCase(),
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      )),
    );
  }
}
