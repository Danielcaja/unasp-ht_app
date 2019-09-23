import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final BuildContext context;
  final VoidCallback onTap;
  final Color color;
  final String text;

  Button({this.context, this.onTap, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        // width: ,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text?.toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
