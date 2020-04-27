import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/shared/utils/string_extensions.dart';

class DepartureFormBloc extends BlocBase {
  TextEditingController goingDateController = TextEditingController();
  TextEditingController goingTimeController = TextEditingController();
  TextEditingController turningDateController = TextEditingController();
  TextEditingController turningTimeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  BehaviorSubject<DateTime> goingDateC = BehaviorSubject<DateTime>();
  BehaviorSubject<DateTime> turningDateC = BehaviorSubject<DateTime>();

  DepartureFormBloc() {
    goingDateController.addListener(validate);
    goingTimeController.addListener(validate);
    turningDateController.addListener(validate);
    turningTimeController.addListener(validate);
    reasonController.addListener(validate);
    locationController.addListener(validate);
    goingDateC.listen((onData) {
      if (onData != null) {
        goingDateController.text = DateFormat('dd/MM/yyyy').format(onData);
        goingTimeController.text = DateFormat('HH:mm').format(onData) + ' h';
      }
    });
    turningDateC.listen((onData) {
      if (onData != null) {
        turningDateController.text = DateFormat('dd/MM/yyyy').format(onData);
        turningTimeController.text = DateFormat('HH:mm').format(onData) + ' h';
      }
    });
  }

  void clearFields() {
    goingDateController.clear();
    goingTimeController.clear();
    turningDateController.clear();
    turningTimeController.clear();
    reasonController.clear();
    locationController.clear();
    goingDateC.add(null);
    turningDateC.add(null);
  }

  final BehaviorSubject<bool> isValidFormController =
      BehaviorSubject<bool>.seeded(false);

  void validate() => isValidFormController.add(goingDateC.value != null &&
      turningDateC.value != null &&
      !locationController.text.isNullOrEmpty &&
      !reasonController.text.isNullOrEmpty);

  @override
  void dispose() {
    goingDateC.close();
    turningDateC.close();
    super.dispose();
  }
}
