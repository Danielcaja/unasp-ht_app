import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/events/models/event_model.dart';
import 'package:unasp_ht/app/shared/components/loading_widget.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<QueryDocumentSnapshot> listEvents;

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
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('events').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: LoadingWidget());
              }
              return SfCalendar(
                  view: CalendarView.month,
                  allowViewNavigation: true,
                  showNavigationArrow: true,
                  allowedViews: <CalendarView>[
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.month,
                    CalendarView.schedule
                  ],
                  dataSource: _getCalendarDataSource(snapshot?.data?.docs),
                  monthViewSettings: MonthViewSettings(
                      showAgenda: true,
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment),
                  appointmentTextStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.lime));
            }));
  }
}

_AppointmentDataSource _getCalendarDataSource(List listEvents) {
  Random random = Random();
  List<Appointment> appointments = <Appointment>[];
  if (listEvents.isNotEmpty) {
    for (var data in listEvents) {
      Appointment events;
      if (data['description'].toUpperCase() == 'Semana de Oração') {
        /// METING
        events = Appointment(
          startTime: DateTime.parse(data['startDate'].toString()),
          endTime: DateTime.parse(data['finalDate'].toString()),
          subject: data['description'].toString(),
          color: Color((random.nextDouble() * 0xFF0F8644).toInt())
              .withOpacity(1.0),
          startTimeZone: '',
          endTimeZone: '',
        );
      } else {
        events = Appointment(
          startTime: DateTime.parse(data['startDate'].toString()),
          endTime: DateTime.parse(data['finalDate'].toString()),
          subject: data['description'].toString(),
          color: Color((random.nextDouble() * 0xFF0F8644).toInt())
              .withOpacity(1.0),
          startTimeZone: '',
          endTimeZone: '',
        );
      }

      appointments.add(events);
    }
  }
  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

Future<List<Events>> getEvents() async {
  try {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('events').get();

    if (snapshot == null || snapshot.docs == null) {
      return null;
    }
    return snapshot.docs.map((f) => Events.fromJson(f.data())).toList();
  } catch (e) {
    return null;
  }
}
