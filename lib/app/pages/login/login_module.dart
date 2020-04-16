import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/login/login_repository.dart';
import 'package:unasp_ht/app/pages/login/signin/signin_bloc.dart';
import 'package:unasp_ht/app/pages/login/recover_pass/recover_pass_bloc.dart';
import 'package:unasp_ht/app/pages/login/signin/signin_page.dart';
import 'package:unasp_ht/app/pages/login/signup/signup_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SigninBloc(i.getDependency<LoginRepository>())),
        Bloc((i) => RecoverPassBloc(i.getDependency<LoginRepository>())),
        Bloc((i) => SignupBloc(i.getDependency<LoginRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LoginRepository(
            AppModule.to.getDependency<FirebaseAuth>(),
            AppModule.to.getDependency<Firestore>()))
      ];

  @override
  Widget get view => SigninPage();

  static Inject get to => Inject<LoginModule>.of();
}
