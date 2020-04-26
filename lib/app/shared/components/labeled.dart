import 'package:flutter/material.dart';

class Labeled extends StatelessWidget {
  final IconData icon;
  final String label;
  final String text;
  final bool inline;

  const Labeled(
      {Key key,
      this.icon,
      @required this.label,
      @required this.text,
      this.inline = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    List<Widget> widgets = [
      Row(
        children: <Widget>[
          Visibility(
            visible: icon != null,
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: primaryColor,
                  size: 15,
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Text(
        text.toUpperCase(),
        style: TextStyle(color: Colors.black54),
      )
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        !inline
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgets,
              )
            : Row(
                children: widgets,
              )
      ],
    );
  }
}
