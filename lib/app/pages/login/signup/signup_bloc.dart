import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class SignupBloc extends BlocBase {
  PageController pageController = PageController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passconfirmController = TextEditingController();

  BehaviorSubject<bool> isValidBasicController =
      BehaviorSubject<bool>.seeded(false);

  isValidForm() {
    isValidBasicController.add(nameController.text != null &&
        nameController.text != "" &&
        emailController.text != null &&
        emailController.text != "" &&
        passController.text != null &&
        passController.text != "" &&
        passconfirmController.text != null &&
        passconfirmController.text != "");
  }

  @override
  void dispose() {
    isValidBasicController.close();
    super.dispose();
  }
}
