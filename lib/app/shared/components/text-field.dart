import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final bool isBlue;
  final bool enabled;
  final TextInputType inputType;
  final TextEditingController controller;
  final Function onChanged;

  CustomTextField(
      {@required this.hintText,
      @required this.icon,
      this.isPassword = false,
      this.isBlue = false,
      @required this.controller,
      this.inputType = TextInputType.text,
      this.enabled = true,
      this.onChanged});

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: isBlue ? Color(0xFF374562) : Colors.grey[200],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          enabled: enabled,
          keyboardType: inputType,
          obscureText: isPassword,
          controller: controller,
          onEditingComplete: () => onChanged,
          style: TextStyle(
            fontSize: 14,
            color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[500],
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[500],
              fontSize: 14,
            ),
            hintText: hintText.toUpperCase(),
            icon: IconTheme(
              data: IconThemeData(
                color: isBlue ? Color(0xFFC2C2C2) : Colors.grey[500],
              ),
              child: Icon(
                icon,
                size: 15,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      );
}
