import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/home/home_page.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/pages/login/signup/signup_bloc.dart';
import 'package:unasp_ht/app/shared/components/button.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';

class RAStep extends StatefulWidget {
  @override
  _RAStepState createState() => _RAStepState();
}

class _RAStepState extends State<RAStep> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).accentColor;
    SignupBloc signupBloc = LoginModule.to.getBloc<SignupBloc>();

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Informe seu RA'.toUpperCase(),
                style: TextStyle(color: Theme.of(context).primaryColor)),
            SizedBox(height: 20),
            CustomTextField(
              icon: FontAwesomeIcons.idCard,
              isPassword: false,
              inputType: TextInputType.number,
              hintText: 'RA',
              isBlue: false,
              controller: signupBloc.raController,
            ),
            SizedBox(height: 20),
            Button(
                color: orange,
                onTap: () async {
                  bool res = await signupBloc.onTap(context);

                  if (res) {
                    await Navigator.of(context).pushReplacement<
                            MaterialPageRoute, MaterialPageRoute>(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                },
                text: 'Continuar')
          ],
        ),
      ),
    );
  }
}
