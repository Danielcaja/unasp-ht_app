import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/departures/departures_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';

class DeparturesPage extends StatefulWidget {
  @override
  _DeparturesPageState createState() => _DeparturesPageState();
}

class _DeparturesPageState extends State<DeparturesPage> {
  final DeparturesBloc _bloc = DeparturesModule.to.getBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saídas".toUpperCase()),
        centerTitle: true,
      ),
    );
  }
}
