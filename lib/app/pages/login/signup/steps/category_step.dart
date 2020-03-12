import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/pages/login/signup/components/card_gender.dart';
import 'package:unasp_ht/app/pages/login/signup/signup_bloc.dart';
import 'package:unasp_ht/app/shared/components/button.dart';

class CategoryStep extends StatefulWidget {
  @override
  _CategoryStepState createState() => _CategoryStepState();
}

class _CategoryStepState extends State<CategoryStep> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    SignupBloc signupBloc = LoginModule.to.getBloc<SignupBloc>();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
                "Selecione as categorias nas quais você se encaixa, lembrando que as informações serão verificadas"
                    .toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CardGender(
                    icon: FontAwesomeIcons.graduationCap,
                    title: "Ensino superior"),
                SizedBox(width: 10),
                CardGender(
                    icon: FontAwesomeIcons.school, title: "Ensino Básico"),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CardGender(icon: FontAwesomeIcons.church, title: "Comunidade"),
                SizedBox(width: 10),
                CardGender(icon: FontAwesomeIcons.bed, title: "Internato"),
              ],
            ),
            SizedBox(height: 20),
            StreamBuilder<bool>(
                stream: signupBloc.isValidBasicController,
                builder: (context, snapshot) {
                  return Button(
                      enabled: snapshot.hasData && snapshot.data,
                      color: orange,
                      onTap: () => signupBloc.pageController.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeIn),
                      context: context,
                      text: "Continuar");
                })
          ],
        ),
      ),
    );
  }
}
