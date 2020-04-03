import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:tuple/tuple.dart';
import 'package:unasp_ht/app/pages/login/login_repository.dart';
import 'package:unasp_ht/app/shared/utils/string_extensions.dart';

class RecoverPassBloc extends BlocBase {
  final LoginRepository loginRepository;
  TextEditingController emailController = TextEditingController();

  BehaviorSubject<bool> isLoadingController =
      BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isValidForm = BehaviorSubject<bool>.seeded(false);

  RecoverPassBloc(this.loginRepository) {
    emailController.addListener(validator);
  }

  validator() => isValidForm.add(!emailController.text.isNullOrEmpty &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text));

  Stream<Tuple2<bool, bool>> get stream => Rx.combineLatest2(
      isLoadingController, isValidForm, (a, b) => Tuple2<bool, bool>(a, b));

  send() async {
    isLoadingController.add(true);
    return await loginRepository.recoverPassword(emailController.text);
  }

  @override
  void dispose() {
    isLoadingController.close();
    isValidForm.close();
    super.dispose();
  }
}
