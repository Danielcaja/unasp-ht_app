import 'package:flutter/material.dart';

class SquareHomeButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final BuildContext context;

  SquareHomeButton(this.text, this.color, this.icon, this.context);

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0, // has the effect of softening the shadow
            )
          ]),
      width: appWidth * .25,
      height: appWidth * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(color: color),
            child: Icon(icon),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text.toUpperCase(),
          )
        ],
      ),
    );
  }
}
