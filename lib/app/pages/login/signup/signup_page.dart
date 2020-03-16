import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/pages/login/signup/signup_bloc.dart';
import 'package:unasp_ht/app/pages/login/signup/steps/basic_info_step.dart';
import 'package:unasp_ht/app/pages/login/signup/steps/category_step.dart';
import 'package:unasp_ht/app/pages/login/signup/steps/gender_step.dart';
import 'package:unasp_ht/app/pages/login/signup/steps/ra_step.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    SignupBloc signupBloc = LoginModule.to.getBloc<SignupBloc>();

    return StreamBuilder<bool>(
        stream: signupBloc.isLoadingController,
        builder: (context, snapshot) {
          return Scaffold(
            key: signupBloc.key,
            appBar: AppBar(
              centerTitle: true,
              title: Text("Cadastro".toUpperCase()),
              leading: snapshot.hasData && snapshot.data
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        if (signupBloc.pageController.page == 0) {
                          Navigator.of(context).pop();
                        } else {
                          signupBloc.pageController.previousPage(
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeIn);
                        }
                      },
                    ),
            ),
            body: (snapshot.hasData && snapshot.data)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : PageView(
                    controller: signupBloc.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      BasicInfoStep(),
                      GenderStep(),
                      CategoryStep(),
                      RAStep()
                    ],
                  ),
          );
        });
  }
}
