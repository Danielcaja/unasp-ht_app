import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';

class EventFormBloc extends BlocBase {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController finalDateController = TextEditingController();
  TextEditingController finalTimeController = TextEditingController();

  BehaviorSubject<DateTime> startDateC = BehaviorSubject<DateTime>();
  BehaviorSubject<DateTime> finalDateC = BehaviorSubject<DateTime>();

  EventFormBloc(EventRepository dependency) {
    descriptionController.addListener(validate);
    startDateController.addListener(validate);
    startTimeController.addListener(validate);
    finalDateController.addListener(validate);
    finalTimeController.addListener(validate);

    startDateC.listen((onData) {
      if (onData != null) {
        startDateController.text = DateFormat('dd/MM/yyyy').format(onData);
        startTimeController.text = DateFormat('HH:mm').format(onData) + ' h';
      }
    });

    finalDateC.listen((onData) {
      if (onData != null) {
        finalDateController.text = DateFormat('dd/MM/yyyy').format(onData);
        finalTimeController.text = DateFormat('HH:mm').format(onData) + ' h';
      }
    });
  }

  void clearFields() {
    descriptionController.clear();
    startDateController.clear();
    startTimeController.clear();
    finalDateController.clear();
    finalTimeController.clear();
    startDateC.add(null);
    finalDateC.add(null);
  }

  final BehaviorSubject<bool> isValidFormController =
      BehaviorSubject<bool>.seeded(false);

  void validate() => isValidFormController.add(startDateC.value != null &&
      finalDateC.value != null &&
      descriptionController.text != '');

  @override
  void dispose() {
    startDateC.close();
    finalDateC.close();
    super.dispose();
  }
}
