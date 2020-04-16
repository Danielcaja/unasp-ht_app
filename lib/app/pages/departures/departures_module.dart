import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/departures/departures_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_page.dart';
import 'package:unasp_ht/app/pages/departures/departures_repository.dart';

class DeparturesModule extends ModuleWidget {
  @override
  List<Bloc> get blocs =>
      [Bloc((i) => DeparturesBloc(i.getDependency<DeparturesRepository>()))];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) =>
            DeparturesRepository(AppModule.to.getDependency<Firestore>()))
      ];

  @override
  Widget get view => DeparturesPage();

  static Inject get to => Inject<DeparturesModule>.of();
}
