import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/events/add_event_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/departures/components/date_picker.dart';
import 'package:unasp_ht/app/pages/departures/components/time_picker.dart';
import 'package:unasp_ht/app/shared/components/button.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final EventFormBloc _bloc = EventsModule.to.getBloc<EventFormBloc>();

  final EventBloc _blocData = EventsModule.to.getBloc<EventBloc>();

  final DateTime today = DateTime.now();

  int _education = 6;
  int _course;
  int _semester;
  String curso = 'Ano';
  String semestre = 'Semestre';

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionar evento'),
        ),
        body: Container(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: appWidth * .1, right: appWidth * .1),
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
                            controller: _bloc.descriptionController,
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    DatePicker(
                                      controller: _bloc.startDateController,
                                      hintText: 'Data ínicio',
                                      icon: FontAwesomeIcons.calendarAlt,
                                      onTap: () async => _bloc.startDateC.add(
                                        await showDatePicker(
                                          context: context,
                                          initialDate: today,
                                          firstDate:
                                              today.add(Duration(days: -1)),
                                          lastDate:
                                              today.add(Duration(hours: 120)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    DatePicker(
                                      controller: _bloc.finalDateController,
                                      hintText: 'Data Fim',
                                      icon: FontAwesomeIcons.calendarAlt,
                                      onTap: () async => _bloc.finalDateC.add(
                                        await showDatePicker(
                                          context: context,
                                          initialDate: today,
                                          firstDate:
                                              today.add(Duration(days: -1)),
                                          lastDate:
                                              today.add(Duration(hours: 120)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    TimePicker(
                                      dateController: _bloc.startDateC,
                                      textController: _bloc.startTimeController,
                                      hintText: 'Hora ínicio',
                                      icon: FontAwesomeIcons.clock,
                                      onTap: () async => await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                            hour:
                                                _bloc.startDateC.value?.hour ??
                                                    0,
                                            minute: _bloc
                                                    .startDateC.value?.minute ??
                                                0),
                                      ).then(
                                        (onValue) => _bloc.startDateC.add(
                                          DateTime(
                                            _bloc.startDateC.value?.year,
                                            _bloc.startDateC.value?.month,
                                            _bloc.startDateC.value?.day,
                                            onValue?.hour,
                                            onValue?.minute,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    TimePicker(
                                      dateController: _bloc.finalDateC,
                                      textController: _bloc.finalTimeController,
                                      hintText: 'Hora Fim',
                                      icon: FontAwesomeIcons.clock,
                                      onTap: () async => await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay(
                                            hour:
                                                _bloc.finalDateC.value?.hour ??
                                                    0,
                                            minute: _bloc
                                                    .finalDateC.value?.minute ??
                                                0),
                                      ).then(
                                        (onValue) => _bloc.finalDateC.add(
                                          DateTime(
                                            _bloc.finalDateC.value?.year,
                                            _bloc.finalDateC.value?.month,
                                            _bloc.finalDateC.value?.day,
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
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('ensino')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Text('Carregando...'),
                                  );
                                }
                                return Container(
                                  padding: EdgeInsets.only(
                                    bottom: 16.0,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: Text('Ensino'.toUpperCase()),
                                          )),
                                      Expanded(
                                        flex: 5,
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                            labelText: 'Selecione',
                                            // hintText: 'Selecione o Ensino',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          isEmpty: _education == 0,
                                          child: DropdownButton<int>(
                                            iconSize: 24,
                                            elevation: 16,
                                            // value: _bloc.ensinoIdController
                                            //     .value.hashCode,
                                            value: _education,
                                            isDense: true,
                                            onChanged: (int newValue) {
                                              setState(() {
                                                _education = newValue;
                                                _bloc.ensinoIdController =
                                                    newValue;
                                              });

                                              switch (_education) {
                                                case 1:
                                                case 2:
                                                case 3:
                                                  curso = 'Ano';
                                                  semestre = 'Turma';
                                                  break;
                                                case 4:
                                                case 5:
                                                  curso = 'Curso';
                                                  semestre = 'Semestre';
                                                  break;
                                              }
                                            },
                                            items: snapshot.data.docs.map(
                                                (DocumentSnapshot document) {
                                              return DropdownMenuItem<int>(
                                                  value: int.tryParse(document
                                                      .data()['id']
                                                      .toString()),
                                                  child: Container(
                                                      child: Text(
                                                    document
                                                        .data()['name']
                                                        .toString(),
                                                  )));
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: _education != 6
                                  ? FirebaseFirestore.instance
                                      .collection('course')
                                      .where('ensinoId', isEqualTo: _education)
                                      .snapshots()
                                  : FirebaseFirestore.instance
                                      .collection('course')
                                      .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Text('Carregando...'),
                                  );
                                } else {
                                  if (snapshot.data.docs.length > 1) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                        bottom: 16.0,
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                child: Text(curso),
                                              )),
                                          Expanded(
                                            flex: 5,
                                            child: InputDecorator(
                                              decoration: const InputDecoration(
                                                labelText: 'Selecione',
                                                // hintText: 'Selecione',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              isEmpty: _course == 0,
                                              child: DropdownButton<int>(
                                                  iconSize: 24,
                                                  elevation: 16,
                                                  value: _course,
                                                  isDense: true,
                                                  // hint: Text(_course.toString()),
                                                  onChanged: (int newValue) {
                                                    setState(() {
                                                      _course = newValue;
                                                      _bloc.courseIdController =
                                                          newValue;
                                                    });
                                                  },
                                                  items: snapshot.data.docs.map(
                                                      (DocumentSnapshot
                                                          document) {
                                                    return DropdownMenuItem<
                                                            int>(
                                                        value: int.tryParse(
                                                            document
                                                                .data()['id']
                                                                .toString()),
                                                        child: Container(
                                                            child: Text(
                                                          document
                                                              .data()['sigla']
                                                              .toString(),
                                                        )));
                                                  }).toList()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return Center(
                                    child: Text('Carregando...'),
                                  );
                                }
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('semester')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Text('Carregando...'),
                                  );
                                }
                                return Container(
                                  padding: EdgeInsets.only(
                                    bottom: 16.0,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            child: Text(semestre),
                                          )),
                                      Expanded(
                                        flex: 5,
                                        child: InputDecorator(
                                          decoration: const InputDecoration(
                                            labelText: 'Selecione',
                                            // hintText: 'Selecione',
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          isEmpty: _semester == null,
                                          child: DropdownButton<int>(
                                            iconSize: 24,
                                            elevation: 16,
                                            value: _semester,
                                            isDense: true,
                                            // hint: Text(_semester.toString()),
                                            onChanged: (int newValue) {
                                              setState(() {
                                                _semester = newValue;
                                                _bloc.semestreIdController =
                                                    newValue;
                                              });
                                            },
                                            items: snapshot.data.docs.map(
                                                (DocumentSnapshot document) {
                                              return DropdownMenuItem<int>(
                                                  value: int.tryParse(document
                                                      .data()['id']
                                                      .toString()),
                                                  child: Container(
                                                      child: Text(
                                                    document
                                                        .data()['description']
                                                        .toString(),
                                                  )));
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(height: 40),
                          StreamBuilder<bool>(
                              stream: _bloc.isValidFormController,
                              builder: (c, snapshot) {
                                return Button(
                                  enabled: snapshot.hasData && snapshot.data,
                                  onTap: () async {
                                    bool res = await _blocData.sendEvents();
                                    if (res) {}
                                    if (res) {
                                      print('deu certo');
                                      _bloc.clearFields();
                                      _blocData.getEvents();
                                      _bloc.isLoadingController.add(false);
                                      Navigator.of(context).pop();
                                    } else {
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('Erro ao enviar! :('),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                      _bloc.isLoadingController.add(false);
                                    }
                                  },
                                  color: theme.accentColor,
                                  text: 'Salvar',
                                );
                              })
                        ]))))));
  }
}
