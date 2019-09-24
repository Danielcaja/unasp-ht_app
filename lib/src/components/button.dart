import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final BuildContext context;
  final VoidCallback onTap;
  final bool isLoading;
  final Color color;
  final String text;
  final double circular;
  final double width;

  Button({
    this.context,
    this.onTap,
    this.color,
    this.text,
    this.width,
    this.circular = 10,
    this.isLoading = false
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    _loading() {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
      );
    }

    _text() {
      return Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Text(
          widget.text?.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      );
    }

    return GestureDetector(
      onTap:
        widget.onTap,
      child: Container(
        height: 50,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.all(Radius.circular(widget.circular))),
        child: Center(
          child: widget.isLoading ? _loading() : _text(),
        ),
      ),
    );
  }
}
