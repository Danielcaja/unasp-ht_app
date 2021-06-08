import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/departures/components/departure_form/departure_form.dart';
import 'package:unasp_ht/app/pages/departures/components/departure_form/departure_form_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';
import 'package:unasp_ht/app/pages/departures/pages/new_departure/new_departure_bloc.dart';
import 'package:unasp_ht/app/shared/components/button.dart';
import 'package:unasp_ht/app/shared/components/loading_widget.dart';

class NewDeparturePage extends StatefulWidget {
  @override
  _NewDeparturePageState createState() => _NewDeparturePageState();
}

class _NewDeparturePageState extends State<NewDeparturePage> {
  final NewDepartureBloc _bloc =
      DeparturesModule.to.getBloc<NewDepartureBloc>();
  final DepartureFormBloc _formBloc =
      DeparturesModule.to.getBloc<DepartureFormBloc>();
  final DeparturesBloc _departuresBloc =
      DeparturesModule.to.getBloc<DeparturesBloc>();

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Saída'),
        centerTitle: true,
      ),
      body: StreamBuilder<bool>(
          stream: _bloc.isLoadingController,
          builder: (c, snapshot) {
            if (snapshot.hasData && snapshot.data) {
              return Container(
                child: Center(
                  child: LoadingWidget(),
                ),
              );
            }

            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    DepartureForm(),
                    const SizedBox(height: 40),
                    StreamBuilder<bool>(
                        stream: _formBloc.isValidFormController,
                        builder: (c, snapshot) {
                          return Button(
                            enabled: snapshot.hasData && snapshot.data,
                            onTap: () async {
                              bool res = await _bloc.sendDeparture();

                              if (res) {
                                _formBloc.clearFields();
                                _departuresBloc.getDepartures();
                                _bloc.isLoadingController.add(false);
                                Navigator.of(context).pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Erro ao enviar! :('),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                _bloc.isLoadingController.add(false);
                              }
                            },
                            color: theme.accentColor,
                            text: 'enviar',
                          );
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }
}
