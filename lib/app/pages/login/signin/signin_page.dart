import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/pages/login/recover_pass/recover_pass_page.dart';
import 'package:unasp_ht/app/pages/login/signin/signin_bloc.dart';
import 'package:unasp_ht/app/pages/login/signup/signup_page.dart';
import 'package:unasp_ht/app/shared/components/button.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';
import 'package:unasp_ht/app/shared/constants.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animTransformEmail;
  Animation<double> animTransformPassword;
  Animation<double> animButtonSigninCircular;
  Animation<double> animButtonTransform;
  Animation<double> animButtonWidth;
  Animation<double> animOpacityForgetPass;
  final SigninBloc _bloc = LoginModule.to.getBloc();

  @override
  void initState() {
    super.initState();
    _bloc.animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose() {
    _bloc.animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animTransformEmail = Tween<double>(begin: 0, end: 380).animate(
        CurvedAnimation(
            parent: _bloc.animationController,
            curve: Interval(0, 0.5, curve: Curves.easeIn)));

    animTransformPassword = Tween<double>(begin: 0, end: -380).animate(
        CurvedAnimation(
            parent: _bloc.animationController,
            curve: Interval(0, 0.5, curve: Curves.easeIn)));

    animButtonSigninCircular = Tween<double>(begin: 10, end: 100).animate(
        CurvedAnimation(
            parent: _bloc.animationController,
            curve: Interval(0, 0.5, curve: Curves.easeIn)));

    animButtonTransform = Tween<double>(begin: 0, end: -100).animate(
        CurvedAnimation(
            parent: _bloc.animationController,
            curve: Interval(0.5, 1, curve: Curves.easeOutExpo)));

    animOpacityForgetPass = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(
            parent: _bloc.animationController,
            curve: Interval(0, 0.2, curve: Curves.easeIn)));

    animButtonWidth =
        Tween<double>(begin: MediaQuery.of(context).size.width, end: 50)
            .animate(CurvedAnimation(
                parent: _bloc.animationController,
                curve: Interval(0, 0.5, curve: Curves.easeIn)));
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    void _forgetPass() {
      Navigator.of(context).push<CupertinoPageRoute>(
          CupertinoPageRoute(builder: (context) => RecoverPassPage()));
    }

    void _signUp() {
      Navigator.of(context).push<CupertinoPageRoute>(
          CupertinoPageRoute(builder: (context) => SignupPage()));
    }

    return Scaffold(
      backgroundColor: BLUE,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: appWidth * .1, right: appWidth * .1),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: appWidth * .3,
                ),
                Image.asset(
                  'assets/img/logo_branco.png',
                  width: 180,
                ),
                SizedBox(
                  height: appWidth * 0.2,
                ),
                AnimatedBuilder(
                  animation: animTransformEmail,
                  child: CustomTextField(
                    controller: _bloc.emailController,
                    hintText: 'Email',
                    icon: FontAwesomeIcons.solidEnvelope,
                    isPassword: false,
                    isBlue: true,
                    inputType: TextInputType.emailAddress,
                  ),
                  builder: (BuildContext context, Widget child) {
                    return Transform.translate(
                      offset: Offset(animTransformEmail.value, 0),
                      child: child,
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                AnimatedBuilder(
                  animation: animTransformPassword,
                  child: CustomTextField(
                      controller: _bloc.passwordController,
                      hintText: 'Senha',
                      icon: FontAwesomeIcons.lock,
                      isPassword: true,
                      isBlue: true,
                      inputType: TextInputType.text),
                  builder: (BuildContext context, Widget child) {
                    return Transform.translate(
                      offset: Offset(animTransformPassword.value, 0),
                      child: child,
                    );
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                AnimatedBuilder(
                  animation: _bloc.animationController,
                  builder: (BuildContext context, Widget child) {
                    return Transform.translate(
                      child: StreamBuilder<bool>(
                          stream: _bloc.isValidForm,
                          builder: (context, snapshot) {
                            return Button(
                                enabled: snapshot.hasData && snapshot.data,
                                context: context,
                                color: ORANGE,
                                text: 'entrar',
                                onTap: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  String res = await _bloc.login();
                                  _bloc.animationController.reverse();
                                  if (res != null) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(res ?? 'Erro'),
                                      backgroundColor: Colors.red,
                                    ));
                                  } else {
                                    _bloc.emailController.clear();
                                    _bloc.passwordController.clear();
                                    await Navigator.of(context).pushReplacement<
                                            CupertinoPageRoute,
                                            CupertinoPageRoute>(
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                HomeModule()));
                                  }
                                },
                                width: animButtonWidth.value,
                                circular: animButtonSigninCircular.value,
                                isLoading: animButtonTransform.value < 0);
                          }),
                      offset: Offset(0, animButtonTransform.value),
                    );
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: AnimatedBuilder(
                    animation: animOpacityForgetPass,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: _signUp,
                          child: Text(
                            'Cadastre-se'.toUpperCase(),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        Text('   |   ',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        GestureDetector(
                          onTap: _forgetPass,
                          child: Text(
                            'Esqueci minha senha'.toUpperCase(),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    builder: (BuildContext context, Widget child) {
                      return Opacity(
                        opacity: animOpacityForgetPass.value,
                        child: child,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
