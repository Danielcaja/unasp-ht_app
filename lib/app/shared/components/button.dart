import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final Color color;
  final String text;
  final double circular;
  final double width;
  final bool enabled;

  Button(
      {@required this.onTap,
      @required this.color,
      @required this.text,
      this.enabled = true,
      this.width,
      this.circular = 10,
      this.isLoading = false});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Widget _loading() => CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );

  Widget _text() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          widget.text?.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      );

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.enabled ? widget.onTap : null,
        child: Container(
          height: 45,
          width: widget.width,
          decoration: BoxDecoration(
              color: widget.enabled ? widget.color : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(widget.circular))),
          child: Center(
            child: widget.isLoading ? _loading() : _text(),
          ),
        ),
      );
}
