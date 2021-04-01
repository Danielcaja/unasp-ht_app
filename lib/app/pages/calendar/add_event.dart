import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  int _education = 6;
  int _course;
  int _semester;
  String curso = 'Ano';

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
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
                                        // hintText: 'Selecione',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      isEmpty: _education == 0,
                                      child: DropdownButton<int>(
                                        iconSize: 24,
                                        elevation: 16,
                                        value: _education,
                                        isDense: true,
                                        onChanged: (int newValue) {
                                          setState(() {
                                            _education = newValue;
                                          });

                                          switch (_education) {
                                            case 1:
                                            case 2:
                                            case 3:
                                              curso = 'Ano';
                                              break;
                                            case 4:
                                            case 5:
                                              curso = 'Curso';
                                              break;
                                          }
                                        },
                                        items: snapshot.data.docs
                                            .map((DocumentSnapshot document) {
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
                                print(snapshot.data.docs.length);
                                return Container(
                                  padding: EdgeInsets.only(
                                    bottom: 16.0,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(child: Text(curso)),
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
                                                          .data()['sigla']
                                                          .toString(),
                                                    )));
                                              }).toList()
                                              // items: <int>[30, 31, 32, 33]
                                              //     .map<DropdownMenuItem<int>>(
                                              //         (int value) {
                                              //   return DropdownMenuItem<int>(
                                              //     value: value,
                                              //     child: Text(value.toString()),
                                              //   );
                                              // }).toList(),
                                              ),
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
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // StreamBuilder<QuerySnapshot>(
                      //     stream: FirebaseFirestore.instance
                      //         .collection('semester')
                      //         .snapshots(),
                      //     builder: (context, snapshot) {
                      //       if (!snapshot.hasData) {
                      //         return Center(
                      //           child: Text('Carregando...'),
                      //         );
                      //       }
                      //       return Container(
                      //         padding: EdgeInsets.only(
                      //           bottom: 16.0,
                      //         ),
                      //         child: Row(
                      //           children: <Widget>[
                      //             Expanded(
                      //                 flex: 2,
                      //                 child: Container(
                      //                   child: Text('Semestre'.toUpperCase()),
                      //                 )),
                      //             Expanded(
                      //               flex: 5,
                      //               child: InputDecorator(
                      //                 decoration: const InputDecoration(
                      //                   labelText: 'Selecione',
                      //                   // hintText: 'Selecione',
                      //                   hintStyle: TextStyle(
                      //                     color: Colors.grey,
                      //                     fontSize: 16.0,
                      //                   ),
                      //                 ),
                      //                 isEmpty: _semester == null,
                      //                 child: DropdownButton<int>(
                      //                   iconSize: 24,
                      //                   elevation: 16,
                      //                   value: _semester,
                      //                   isDense: true,
                      //                   // hint: Text(_semester.toString()),
                      //                   onChanged: (int newValue) {
                      //                     setState(() {
                      //                       _semester = newValue;
                      //                     });
                      //                   },
                      //                   items: snapshot.data.docs
                      //                       .map((DocumentSnapshot document) {
                      //                     return DropdownMenuItem<int>(
                      //                         value: int.tryParse(document
                      // .data()['id']
                      // .toString()),
                      //                         child: Container(
                      //                             child: Text(
                      //                           document
                      //                               .data()['description']
                      //                               .toString(),
                      //                         )));
                      //                   }).toList(),
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     }),
                      SizedBox(height: 40),
                      StreamBuilder<bool>(
                          // stream: _formBloc.isValidFormController,
                          builder: (c, snapshot) {
                        return Button(
                          enabled: snapshot.hasData && snapshot.data,
                          onTap: () async {
                            // bool res = await _bloc.sendDeparture();

                            // if (res) {
                            //   // _formBloc.clearFields();
                            //   // _departuresBloc.getDepartures();
                            //   // _bloc.isLoadingController.add(false);
                            //   Navigator.of(context).pop();
                            // } else {
                            //   Scaffold.of(context).showSnackBar(
                            //     SnackBar(
                            //       content: Text('Erro ao enviar! :('),
                            //       backgroundColor: Colors.red,
                            //     ),
                            //   );
                            //   // _bloc.isLoadingController.add(false);
                            // }
                          },
                          color: theme.accentColor,
                          text: 'Salvar',
                        );
                      })
                    ])))));
  }
}
