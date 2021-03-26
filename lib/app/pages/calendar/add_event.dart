import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/pages/calendar/ensino/ensino_model.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/departures/components/date_picker.dart';
import 'package:unasp_ht/app/pages/departures/components/time_picker.dart';
import 'package:unasp_ht/app/shared/components/loading_widget.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final BehaviorSubject<List<Ensino>> ensinosController =
      BehaviorSubject<List<Ensino>>();

  // ignore: inference_failure_on_uninitialized_variable
  var selectedCurrency;

  @override
  Widget build(BuildContext context) {
    getEnsinos().then((ensinos) => ensinosController.add(ensinos));

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
                              return Text("Carregando...");
                            }
                            List<DropdownMenuItem> ensinoArray = [];
                            for (int i = 0;
                                i < snapshot.data.docs.length;
                                i++) {
                              DocumentSnapshot snap = snapshot.data.docs[i];
                              ensinoArray.add(DropdownMenuItem<dynamic>(
                                child: Text(
                                  snap.data()['id'].toString(),
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                value: "${snap.data()['name']}",
                              ));
                            }
                            SizedBox(height: 15);
                            return Column(children: <Widget>[
                              DropdownButton<dynamic>(
                                  value: selectedCurrency,
                                  elevation: 16,
                                  items: ensinoArray.map((item) {
                                    DropdownMenuItem<dynamic>(
                                      value: item.child,
                                      child: Text(item.value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (dynamic currencyValue) {
                                    final snackBar = SnackBar(
                                        content: Text(
                                      'Selecionado $currencyValue',
                                    ));
                                    Scaffold.of(context).showSnackBar(snackBar);
                                    setState(() {
                                      selectedCurrency = currencyValue;
                                    });
                                  },
                                  isExpanded: true,
                                  hint: Text('Selecione o ensino'))
                            ]);
                          }),
                    ])))));
  }

  Future<List<Ensino>> getEnsinos() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('ensino').get();

      if (snapshot == null || snapshot.docs == null) {
        return null;
      }
      // return snapshot.docs.map((f) => Ensino.fromJson(f.data())).toList();
      return snapshot.docs
          .map((f) =>
              Ensino.fromJson(f.data()..addAll(<String, dynamic>{'id': f.id})))
          .toList();
    } catch (e) {
      return null;
    }
  }

  @override
  void dispose() {
    ensinosController.close();
    super.dispose();
  }
}
