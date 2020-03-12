import 'package:flutter/material.dart';

class CardGender extends StatelessWidget {
  final String title;
  final IconData icon;

  const CardGender({Key key, @required this.title, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        color: Colors.grey[200],
        child: Container(
          height: MediaQuery.of(context).size.width / 2.3,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.grey,
                size: 45,
              ),
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
