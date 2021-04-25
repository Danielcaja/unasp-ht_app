import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/add_event.dart';
import 'package:unasp_ht/app/pages/events/add_event_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';

class EventsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc<EventBloc>((i) => EventBloc(i.getDependency<EventRepository>())),
        Bloc<EventFormBloc>(
            (i) => EventFormBloc(i.getDependency<EventRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency<EventRepository>((i) =>
            EventRepository(AppModule.to.getDependency<FirebaseFirestore>()))
      ];

  @override
  Widget get view => AddEventPage();

  static Inject get to => Inject<EventsModule>.of();
}
