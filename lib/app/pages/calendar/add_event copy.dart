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
            Text(
              'Descrição do evento'.toUpperCase(),
              style: TextStyle(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            CustomTextField(
              hintText: 'Evento',
              icon: FontAwesomeIcons.infoCircle,
              // controller: _bloc.reasonController,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  DatePicker(
                    // controller: _bloc.turningDateController,
                    hintText: 'Data',
                    icon: FontAwesomeIcons.calendarAlt,
                    // onTap: () async => _bloc.turningDateC.add(
                    //   await showDatePicker(
                    //     context: context,
                    //     initialDate: today,
                    //     firstDate: today.add(Duration(days: -1)),
                    //     lastDate: today.add(Duration(hours: 120)),
                    //   ),
                    // ),
                  ),
                  const SizedBox(height: 10),
                  TimePicker(
                    // dateController: _bloc.turningDateC,
                    // textController: _bloc.turningTimeController,
                    hintText: 'Hora',
                    icon: FontAwesomeIcons.clock,
                    // onTap: () async => await showTimePicker(
                    //   context: context,
                    //   initialTime: TimeOfDay(
                    //       hour: _bloc.turningDateC.value?.hour ?? 0,
                    //       minute: _bloc.turningDateC.value?.minute ?? 0),
                    // ).then(
                    //   (onValue) => _bloc.turningDateC.add(
                    //     DateTime(
                    //       _bloc.turningDateC.value?.year,
                    //       _bloc.turningDateC.value?.month,
                    //       _bloc.turningDateC.value?.day,
                    //       onValue?.hour,
                    //       onValue?.minute,
                    //     ),
                    //   ),
                    // ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    // style: const TextStyle(color: Colors.deepPurple),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Ensino Médio',
                      'Ensino Superior',
                      'Ensino Básico',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  CustomTextField(
                    enabled: false,
                    hintText: 'Selecione o tipo de ensino',
                    icon: FontAwesomeIcons.graduationCap,
                  ),
                  CustomTextField(
                    enabled: false,
                    hintText: 'Selecione o Curso',
                    icon: FontAwesomeIcons.graduationCap,
                  ),
                  CustomTextField(
                    enabled: false,
                    hintText: 'Selecione o Semestre',
                    icon: FontAwesomeIcons.graduationCap,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
