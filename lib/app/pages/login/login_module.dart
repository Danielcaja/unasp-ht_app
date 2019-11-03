import 'package:unasp_ht/app/pages/login/signin/signin_bloc.dart';
import 'package:unasp_ht/app/pages/login/recover_pass/recover_pass_bloc.dart';
import 'package:unasp_ht/app/pages/login/signin/signin_page.dart';
import 'package:unasp_ht/app/pages/login/signup/signup_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SigninBloc()),
        Bloc((i) => RecoverPassBloc()),
        Bloc((i) => SignupBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => SigninPage();

  static Inject get to => Inject<LoginModule>.of();
}
