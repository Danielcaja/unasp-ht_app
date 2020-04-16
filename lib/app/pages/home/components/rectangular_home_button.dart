import 'package:flutter/material.dart';

class RectangularHomeButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final Function onTap;

  RectangularHomeButton(this.text, this.color, this.icon, this.onTap);

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0, // has the effect of softening the shadow
              )
            ]),
        width: appWidth * .4,
        height: appWidth * .17,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconTheme(
                data: IconThemeData(color: color),
                child: Icon(icon),
              ),
            ),
            Text(
              text.toUpperCase(),
            )
          ],
        ),
      ),
    );
  }
}
