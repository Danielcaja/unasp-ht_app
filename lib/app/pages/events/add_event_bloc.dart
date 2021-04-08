import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';

class EventFormBloc extends BlocBase {
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();

  BehaviorSubject<DateTime> startDateC = BehaviorSubject<DateTime>();

  EventFormBloc(EventRepository dependency) {
    startDateController.addListener(validate);
    startTimeController.addListener(validate);

    startDateC.listen((onData) {
      if (onData != null) {
        startDateController.text = DateFormat('dd/MM/yyyy').format(onData);
        startTimeController.text = DateFormat('HH:mm').format(onData) + ' h';
      }
    });
  }

  void clearFields() {
    startDateController.clear();
    startTimeController.clear();
    startDateC.add(null);
  }

  final BehaviorSubject<bool> isValidFormController =
      BehaviorSubject<bool>.seeded(false);

  void validate() => isValidFormController.add(startDateC.value != null);

  @override
  void dispose() {
    startDateC.close();
    super.dispose();
  }
}
