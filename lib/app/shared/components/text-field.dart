import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool isBlue;
  final TextInputType inputType;

  CustomTextField(
      {this.hintText, this.icon, this.isPassword, this.isBlue, this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
          color: isBlue ? Color(0xFF374562) : Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType: inputType,
        obscureText: isPassword,
        style: TextStyle(
            fontSize: 14, color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[500]),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[500],
                fontSize: 14),
            hintText: hintText.toUpperCase(),
            icon: IconTheme(
              data: IconThemeData(
                  color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[500]),
              child: Icon(icon),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
