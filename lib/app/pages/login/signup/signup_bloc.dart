import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/pages/home/home_page.dart';
import 'package:unasp_ht/app/pages/login/login_repository.dart';
import 'package:unasp_ht/app/pages/login/models/user_model.dart';
import 'package:unasp_ht/app/pages/login/signin/signin_page.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

class SignupBloc extends BlocBase {
  final LoginRepository loginRepository;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  PageController pageController = PageController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passconfirmController = TextEditingController();
  TextEditingController raController = TextEditingController();

  BehaviorSubject<String> genderController = BehaviorSubject<String>();
  BehaviorSubject<CategoryEnum> mainCategoryController =
      BehaviorSubject<CategoryEnum>();
  BehaviorSubject<CategoryEnum> secondaryCategoryController =
      BehaviorSubject<CategoryEnum>();
  BehaviorSubject<bool> isLoadingController = BehaviorSubject<bool>();

  BehaviorSubject<bool> isValidBasicController =
      BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isValidGenderController =
      BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isValidCategoryController =
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

  sendData() async => await loginRepository.signUp(UserModel()
    ..name = nameController.text
    ..email = emailController.text
    ..password = passController.text
    ..genre = genderController.value
    ..mainCategory = mainCategoryController.value
    ..secondaryCategory = secondaryCategoryController.value);

  isValidBasicForm() => isValidBasicController.add(nameController.text !=
          null &&
      nameController.text != "" &&
      emailController.text != null &&
      emailController.text != "" &&
      passController.text != null &&
      passController.text != "" &&
      passconfirmController.text != null &&
      passconfirmController.text != "" &&
      (passController.text == passconfirmController.text) &&
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text));

  onTap(BuildContext context) async {
    if (mainCategoryController.hasValue &&
            mainCategoryController.value == CategoryEnum.Church ||
        raController.text != null) {
      isLoadingController.add(true);
      String res = await sendData();
      isLoadingController.add(false);

      if (res != null) {
        key.currentState.showSnackBar(SnackBar(
          content: Text(res ?? ""),
          backgroundColor: Colors.red,
        ));
      } else {
        Navigator.of(key.currentContext).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    } else {
      pageController.nextPage(
          duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    }
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
