import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';
import 'package:unasp_ht/app/shared/constants.dart';
import '../../app_module.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

AppBloc appBloc = AppModule.to.getBloc<AppBloc>();

class _CalendarPageState extends State<CalendarPage> {
  List<QueryDocumentSnapshot> listEvents;

  @override
  Widget build(BuildContext context) {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');

    return Scaffold(
        appBar: AppBar(
          title: Text('Calendário'),
          actions: appBloc.currentUser.value.mainCategory != CategoryEnum.Admin
              ? null
              : <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context)
                        .push<CupertinoPageRoute>(CupertinoPageRoute(
                            builder: (context) => EventsModule())),
                  )
                ],
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: events.snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasError) {
                return Text('Something went wrong');
              } else if (snapshots.hasData) {
                return SfCalendar(
                    dataSource: _getCalendarDataSource(snapshots?.data?.docs),
                    view: CalendarView.month,
                    onTap: calendarTapped,
                    allowViewNavigation: true,
                    showNavigationArrow: true,
                    allowedViews: <CalendarView>[
                      CalendarView.day,
                      CalendarView.week,
                      CalendarView.month,
                      CalendarView.schedule
                    ],
                    monthViewSettings: MonthViewSettings(
                        showAgenda: true,
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.appointment),
                    appointmentTextStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.lime));
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  void calendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.appointment) {
      String subject = details.appointments[0].subject.toString();
      String dataInicial = DateFormat('dd/MM/yyyy')
          .format(details.appointments[0].startTime as DateTime);
      String dataFinal = DateFormat('dd/MM/yyyy')
          .format(details.appointments[0].endTime as DateTime);

      String horaInicial = DateFormat('HH:mm')
          .format(details.appointments[0].startTime as DateTime);
      String horaFinal = DateFormat('HH:mm')
          .format(details.appointments[0].endTime as DateTime);

      showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Container(
                  child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText2,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Icon(
                          Icons.info,
                          size: 20,
                          color: BLUE,
                        ),
                      ),
                    ),
                    TextSpan(
                        text: 'Visualização do evento',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ],
                ),
              )),
              content: Container(
                  child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText2,
                  children: <TextSpan>[
                    TextSpan(
                      text: '$subject  \n',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                      text: dataInicial == dataFinal
                          ? 'Data: $dataInicial'
                          : 'Ínicio: $dataInicial ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                      text: dataInicial != dataFinal
                          ? ' - $horaInicial \n Fim: $dataFinal - $horaFinal'
                          : horaInicial != horaFinal
                              ? ' de $horaInicial até $horaFinal\n'
                              : ' ás $horaInicial',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              )),
              actions: <Widget>[
                appBloc.currentUser.value.mainCategory != CategoryEnum.Admin
                    ? null
                    : TextButton(
                        onPressed: () {
                          deletEvent(details, context);
                        },
                        child: Text('Deletar')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Fechar'))
              ],
            );
          });
    }
  }

  Future<bool> deletEvent(
      CalendarTapDetails event, BuildContext context) async {
    await delet(event.appointments[0].subject.toString());
    Navigator.of(context).pop();
    return true;
  }

  String formatDescription(String description) {
    const end = '|';
    final endIndex = description.indexOf(end, 0);
    final onlyDescription = description.toString().substring(0, endIndex);
    return onlyDescription;
  }

  Future<bool> delet(String description) async {
    final desc = formatDescription(description);
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .where('description', isEqualTo: desc)
          .get()
          .then((value) {
        print(value);
        print(value.docs);
        value.docs.forEach((element) {
          FirebaseFirestore.instance
              .collection('events')
              .doc(element.id)
              .delete()
              .then((_) {
            print('Success!');
          });
        });
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}

_AppointmentDataSource _getCalendarDataSource(List listEvents) {
  Random random = Random();
  List<Appointment> appointments = <Appointment>[];

  appointments.add(Appointment(
      startTime: DateTime(2021, 03, 8, 23),
      endTime: DateTime(2021, 03, 8, 00),
      subject: 'Orientação TCC',
      color: Colors.purple,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
  if (listEvents.isNotEmpty) {
    for (var data in listEvents) {
      DateTime dataInicial = DateTime.parse(data['startDate'].toString());

      Appointment events = Appointment(
          startTime: DateTime.parse(data['startDate'].toString()),
          endTime: data['description'].toUpperCase() == 'SEMANA DE ORAÇÃO'
              ? dataInicial.add(Duration(hours: 1, minutes: 30))
              : DateTime.parse(data['finalDate'].toString()),
          subject: data['description'].toString() +
              ' | ' +
              data['subjectDescription'].toString(),
          color: Color((random.nextDouble() * 0xFF0F8644).toInt())
              .withOpacity(1.0),
          startTimeZone: '',
          endTimeZone: '',
          recurrenceRule:
              data['description'].toUpperCase() == 'SEMANA DE ORAÇÃO'
                  ? 'FREQ=DAILY;INTERVAL=1;COUNT=5'
                  : '');
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
