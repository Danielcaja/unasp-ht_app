import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/departures/components/date_picker.dart';
import 'package:unasp_ht/app/pages/departures/components/time_picker.dart';
import 'package:unasp_ht/app/pages/departures/components/departure_form/departure_form_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';

class DepartureForm extends StatefulWidget {
  @override
  _DepartureFormState createState() => _DepartureFormState();
}

class _DepartureFormState extends State<DepartureForm> {
  final DepartureFormBloc _bloc =
      DeparturesModule.to.getBloc<DepartureFormBloc>();
  final DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'ida / volta'.toUpperCase(),
          style: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  DatePicker(
                    controller: _bloc.goingDateController,
                    hintText: 'Data',
                    icon: FontAwesomeIcons.calendarAlt,
                    onTap: () async => _bloc.goingDateC.add(
                      await showDatePicker(
                        context: context,
                        initialDate: today,
                        firstDate: today.add(Duration(days: -1)),
                        lastDate: today.add(Duration(hours: 120)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TimePicker(
                    dateController: _bloc.goingDateC,
                    textController: _bloc.goingTimeController,
                    hintText: 'Hora',
                    icon: FontAwesomeIcons.clock,
                    onTap: () async => await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                          hour: _bloc.goingDateC.value?.hour ?? 0,
                          minute: _bloc.goingDateC.value?.minute ?? 0),
                    ).then(
                      (onValue) {
                        if (onValue != null) {
                          _bloc.goingDateC.add(
                            DateTime(
                              _bloc.goingDateC.value?.year,
                              _bloc.goingDateC.value?.month,
                              _bloc.goingDateC.value?.day,
                              onValue?.hour,
                              onValue?.minute,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: <Widget>[
                  DatePicker(
                    controller: _bloc.turningDateController,
                    hintText: 'Data',
                    icon: FontAwesomeIcons.calendarAlt,
                    onTap: () async => _bloc.turningDateC.add(
                      await showDatePicker(
                        context: context,
                        initialDate: today,
                        firstDate: today.add(Duration(days: -1)),
                        lastDate: today.add(Duration(hours: 120)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TimePicker(
                    dateController: _bloc.turningDateC,
                    textController: _bloc.turningTimeController,
                    hintText: 'Hora',
                    icon: FontAwesomeIcons.clock,
                    onTap: () async => await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(
                          hour: _bloc.turningDateC.value?.hour ?? 0,
                          minute: _bloc.turningDateC.value?.minute ?? 0),
                    ).then(
                      (onValue) => _bloc.turningDateC.add(
                        DateTime(
                          _bloc.turningDateC.value?.year,
                          _bloc.turningDateC.value?.month,
                          _bloc.turningDateC.value?.day,
                          onValue?.hour,
                          onValue?.minute,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'detalhes'.toUpperCase(),
          style: TextStyle(
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: 'Local',
          icon: FontAwesomeIcons.mapMarkerAlt,
          controller: _bloc.locationController,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          hintText: 'Motivo',
          icon: FontAwesomeIcons.infoCircle,
          controller: _bloc.reasonController,
        ),
      ],
    );
  }
}
