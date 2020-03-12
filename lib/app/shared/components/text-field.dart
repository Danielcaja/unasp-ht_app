import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool isBlue;
  final TextInputType inputType;
  final TextEditingController controller;
  final Function(String) onChanged;

  CustomTextField(
      {@required this.hintText,
      @required this.icon,
      @required this.isPassword,
      @required this.isBlue,
      @required this.controller,
      @required this.inputType,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: isBlue ? Color(0xFF374562) : Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextField(
        keyboardType: inputType,
        obscureText: isPassword,
        controller: controller,
        onChanged: onChanged,
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
              child: Icon(
                icon,
                size: 15,
              ),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
