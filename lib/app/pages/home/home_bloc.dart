import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/pages/home/home_repository.dart';
import 'package:unasp_ht/app/pages/home/models/news_model.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';

class HomeBloc extends BlocBase {
  final HomeRepository _repository;

  HomeBloc(this._repository) {
    _repository.getNews().then((news) => newsController.add(news));
  }

  final BehaviorSubject<List<News>> newsController =
      BehaviorSubject<List<News>>();

  void signOut(BuildContext context) {
    Navigator.of(context)
        .pushReplacement<CupertinoPageRoute, CupertinoPageRoute>(
            CupertinoPageRoute(builder: (context) => LoginModule()));
  }

  @override
  void dispose() {
    newsController.close();
    super.dispose();
  }
}
