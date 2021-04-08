import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calendário'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.calendar_today_rounded,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).push<CupertinoPageRoute>(
                  CupertinoPageRoute(builder: (context) => EventsModule())),
            )
          ],
        ),
        body: SfCalendar(
            view: CalendarView.month,
            showNavigationArrow: true,
            dataSource: _getCalendarDataSource(),
            monthViewSettings: MonthViewSettings(
                showAgenda: true,
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.appointment),
            appointmentTextStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.lime)));
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];

  appointments.add(Appointment(
      startTime: DateTime(2021, 03, 8, 23),
      endTime: DateTime(2021, 03, 8, 00),
      subject: 'Orientação TCC',
      color: Colors.blue,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 4)),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Prova de Matematica',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ));

  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 4)),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Lista de Matematica',
    color: Colors.green,
    startTimeZone: '',
    endTimeZone: '',
  ));

  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 9)),
    endTime: DateTime.now().add(Duration(days: 5)),
    subject: 'Lista de Matematica',
    color: Colors.green,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 4)),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Lista de Matematica',
    color: Colors.green,
    startTimeZone: '',
    endTimeZone: '',
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: 2)),
    endTime: DateTime.now().add(Duration(hours: 1)),
    subject: 'Atividade de Biologia',
    color: Colors.pink,
    startTimeZone: '',
    endTimeZone: '',
  ));
  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
