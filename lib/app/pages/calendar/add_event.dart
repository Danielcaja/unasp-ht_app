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
    double appWidth = MediaQuery.of(context).size.width;

    ThemeData theme = Theme.of(context);
    final DateTime today = DateTime.now();
    String dropdownValue = 'Ensino Básico';

    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar evento'),
      ),
      body: Container(
          child: Padding(
              padding:
                  EdgeInsets.only(left: appWidth * .1, right: appWidth * .1),
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    SizedBox(
                      height: appWidth * .1,
                    ),
                    Text(
                      'Descrição do evento'.toUpperCase(),
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomTextField(
                      hintText: 'Evento',
                      icon: FontAwesomeIcons.infoCircle,
                    ),
                    SizedBox(height: 15),
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
                    SizedBox(
                      height: 15,
                    ),
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
                    SizedBox(
                      height: appWidth * .1,
                    ),
                    Text(
                      'Público alvo do evento'.toUpperCase(),
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'teste'.toUpperCase(),
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //   DropdownButton<String>(
                    //   value: dropdownValue,
                    //   icon: Icon(Icons.arrow_downward),
                    //   iconSize: 24,
                    //   elevation: 16,
                    //   // style: const TextStyle(color: Colors.deepPurple),
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     color: Colors.grey[500],
                    //   ),
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       dropdownValue = newValue;
                    //     });
                    //   },
                    //   items: <String>[
                    //     'Ensino Médio',
                    //     'Ensino Superior',
                    //     'Ensino Básico',
                    //   ].map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    // ),
                  ])))),
    );
  }
}
