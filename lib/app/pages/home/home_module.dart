import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/home/home_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/home/home_page.dart';
import 'package:unasp_ht/app/pages/home/home_repository.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc<HomeBloc>((i) => HomeBloc(i.getDependency())),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency<HomeRepository>(
            (_) => HomeRepository(AppModule.to.getDependency<Firestore>()))
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
