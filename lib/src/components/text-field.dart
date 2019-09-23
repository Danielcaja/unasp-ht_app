import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool isBlue;

  CustomTextField({this.hintText, this.icon, this.isPassword, this.isBlue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
          color: isBlue ? Color(0xFF374562) : Colors.grey[350],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType:
            isPassword ? TextInputType.text : TextInputType.emailAddress,
        obscureText: isPassword,
        style: TextStyle(
            fontSize: 14, color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[800]),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[800],
                fontSize: 14),
            hintText: hintText.toUpperCase(),
            icon: IconTheme(
              data: IconThemeData(
                  color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[800]),
              child: Icon(icon),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
