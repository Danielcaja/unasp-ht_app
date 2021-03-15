import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/departures/components/departure_form/departure_form_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_page.dart';
import 'package:unasp_ht/app/pages/departures/departures_repository.dart';
import 'package:unasp_ht/app/pages/departures/pages/new_departure/new_departure_bloc.dart';

class DeparturesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc<DeparturesBloc>(
            (i) => DeparturesBloc(i.getDependency<DeparturesRepository>())),
        Bloc<NewDepartureBloc>(
            (i) => NewDepartureBloc(i.getDependency<DeparturesRepository>())),
        Bloc<DepartureFormBloc>((i) => DepartureFormBloc())
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency<DeparturesRepository>((i) => DeparturesRepository(
            AppModule.to.getDependency<FirebaseFirestore>()))
      ];

  @override
  Widget get view => DeparturesPage();

  static Inject get to => Inject<DeparturesModule>.of();
}
