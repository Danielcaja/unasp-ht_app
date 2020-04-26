import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/shared/utils/string_extensions.dart';
import 'package:unasp_ht/app/pages/login/login_repository.dart';
import 'package:unasp_ht/app/pages/login/models/user_model.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

class SignupBloc extends BlocBase {
  final LoginRepository loginRepository;
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final PageController pageController = PageController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController passconfirmController = TextEditingController();
  final TextEditingController raController = TextEditingController();

  final BehaviorSubject<String> genderController = BehaviorSubject<String>();
  final BehaviorSubject<CategoryEnum> mainCategoryController =
      BehaviorSubject<CategoryEnum>();
  final BehaviorSubject<CategoryEnum> secondaryCategoryController =
      BehaviorSubject<CategoryEnum>();
  final BehaviorSubject<bool> isLoadingController = BehaviorSubject<bool>();

  final BehaviorSubject<bool> isValidBasicController =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> isValidGenderController =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> isValidCategoryController =
      BehaviorSubject<bool>.seeded(false);

  SignupBloc(this.loginRepository) {
    nameController.addListener(isValidBasicForm);
    emailController.addListener(isValidBasicForm);
    passController.addListener(isValidBasicForm);
    passconfirmController.addListener(isValidBasicForm);
    genderController.listen((event) {
      isValidGenderController.add(event != null);
    });

    mainCategoryController.listen((value) {
      isValidCategoryController
          .add(value != null && value == CategoryEnum.Church);
    });
    secondaryCategoryController.listen((value) {
      isValidCategoryController.add(mainCategoryController.value != null &&
          ((mainCategoryController.value != CategoryEnum.Church &&
                  secondaryCategoryController.value != null) ||
              mainCategoryController.value == CategoryEnum.Church));
    });
  }

  Future<String> sendData() async => await loginRepository.signUp(UserModel()
    ..name = nameController.text
    ..email = emailController.text
    ..password = passController.text
    ..genre = genderController.value
    ..mainCategory = mainCategoryController.value
    ..ra = raController.text
    ..secondaryCategory = secondaryCategoryController.value);

  void isValidBasicForm() => isValidBasicController.add(nameController.text !=
          null &&
      nameController.text != '' &&
      emailController.text != null &&
      emailController.text != '' &&
      passController.text != null &&
      passController.text != '' &&
      passconfirmController.text != null &&
      passconfirmController.text != '' &&
      (passController.text == passconfirmController.text) &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text));

  Future<bool> onTap(BuildContext context) async {
    if (mainCategoryController.hasValue &&
        (mainCategoryController.value == CategoryEnum.Church ||
            !raController.text.isNullOrEmpty)) {
      isLoadingController.add(true);
      String res = await sendData();
      isLoadingController.add(false);

      if (res != null) {
        key.currentState.showSnackBar(SnackBar(
          content: Text(res ?? ''),
          backgroundColor: Colors.red,
        ));
      } else {
        await Navigator.of(key.currentContext)
            .pushReplacement<MaterialPageRoute, MaterialPageRoute>(
                MaterialPageRoute(builder: (context) => HomeModule()));
      }
      return res == null;
    } else {
      await pageController.nextPage(
          duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    }
    return false;
  }

  @override
  void dispose() {
    isLoadingController.close();
    isValidCategoryController.close();
    mainCategoryController.close();
    secondaryCategoryController.close();
    isValidGenderController.close();
    isValidBasicController.close();
    super.dispose();
  }
}
