import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(20),
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'atalhos iniciais'.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text('äsd')
            ],
          )),
    );
  }
}
