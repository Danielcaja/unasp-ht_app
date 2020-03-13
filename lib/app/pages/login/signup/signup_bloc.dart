import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/pages/login/login_repository.dart';
import 'package:unasp_ht/app/pages/login/models/user_model.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

class SignupBloc extends BlocBase {
  final LoginRepository loginRepository;
  PageController pageController = PageController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passconfirmController = TextEditingController();

  BehaviorSubject<String> genderController = BehaviorSubject<String>();
  BehaviorSubject<CategoryEnum> mainCategoryController =
      BehaviorSubject<CategoryEnum>();
  BehaviorSubject<CategoryEnum> secondaryCategoryController =
      BehaviorSubject<CategoryEnum>();

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

  sendData() async {
    UserModel model = UserModel()
      ..name = nameController.text
      ..email = emailController.text
      ..password = passController.text
      ..genre = genderController.value
      ..mainCategory = mainCategoryController.value
      ..secondaryCategory = secondaryCategoryController.value;

    await loginRepository.signUp(model);
  }

  isValidBasicForm() {
    isValidBasicController.add(nameController.text != null &&
        nameController.text != "" &&
        emailController.text != null &&
        emailController.text != "" &&
        passController.text != null &&
        passController.text != "" &&
        passconfirmController.text != null &&
        passconfirmController.text != "" &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text));
  }

  @override
  void dispose() {
    isValidCategoryController.close();
    mainCategoryController.close();
    secondaryCategoryController.close();
    isValidGenderController.close();
    isValidBasicController.close();
    super.dispose();
  }
}
