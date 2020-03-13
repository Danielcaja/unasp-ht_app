import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardGender extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool disabled;
  final bool horizontal;

  const CardGender(
      {Key key,
      @required this.title,
      @required this.icon,
      @required this.isSelected,
      this.horizontal = false,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: disabled ? Colors.grey[400] : Colors.grey[200],
      child: Container(
        width: horizontal
            ? MediaQuery.of(context).size.width * .9
            : MediaQuery.of(context).size.width * .39,
        height: horizontal ? 80 : MediaQuery.of(context).size.width / 2.3,
        padding: EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[
            Center(
              child: horizontal
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          icon,
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          size: 45,
                        ),
                        Text(
                          title.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              fontSize: 14),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(
                          icon,
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                          size: 45,
                        ),
                        Text(
                          title.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              fontSize: 14),
                        )
                      ],
                    ),
            ),
            isSelected
                ? Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      FontAwesomeIcons.solidCheckCircle,
                      color: Colors.green,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
