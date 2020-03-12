import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/pages/login/signup/components/card_gender.dart';
import 'package:unasp_ht/app/pages/login/signup/signup_bloc.dart';
import 'package:unasp_ht/app/shared/components/button.dart';

class GenderStep extends StatefulWidget {
  @override
  _GenderStepState createState() => _GenderStepState();
}

class _GenderStepState extends State<GenderStep> {
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
            Text("Informe seu gênero".toUpperCase(),
                style: TextStyle(color: Theme.of(context).primaryColor)),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                CardGender(icon: FontAwesomeIcons.male, title: "Masculino"),
                SizedBox(width: 10),
                CardGender(icon: FontAwesomeIcons.female, title: "Feminino"),
              ],
            ),
            SizedBox(height: 20),
            Button(
                color: orange,
                onTap: () => signupBloc.pageController.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeIn),
                context: context,
                text: "Continuar")
          ],
        ),
      ),
    );
  }
}
