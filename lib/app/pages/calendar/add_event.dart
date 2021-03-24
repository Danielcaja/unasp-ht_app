import 'package:flutter/material.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/departures/components/date_picker.dart';
import 'package:unasp_ht/app/pages/departures/components/departure_form/departure_form_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';
import 'package:unasp_ht/app/pages/departures/components/time_picker.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final DateTime today = DateTime.now();
    String dropdownValue = 'Ensino Básico';

    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionar evento'),
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text(
                    'Descrição do evento'.toUpperCase(),
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
