import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/home/home_module.dart';
import 'package:unasp_ht/app/pages/login/recover_pass/recover_pass_page.dart';
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
  AnimationController _animationController;
  Animation animTransformEmail;
  Animation animTransformPassword;
  Animation animButtonSigninCircular;
  Animation animButtonTransform;
  Animation animButtonWidth;
  Animation animOpacityForgetPass;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animTransformEmail = Tween<double>(begin: 0, end: 380).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 0.5, curve: Curves.easeIn)));

    animTransformPassword = Tween<double>(begin: 0, end: -380).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 0.5, curve: Curves.easeIn)));

    animButtonSigninCircular = Tween<double>(begin: 10, end: 50).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 0.5, curve: Curves.easeIn)));

    animButtonTransform = Tween<double>(begin: 0, end: -100).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 1, curve: Curves.easeOutExpo)));

    animOpacityForgetPass = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0, 0.2, curve: Curves.easeIn)));

    animButtonWidth =
        Tween<double>(begin: MediaQuery.of(context).size.width, end: 50)
            .animate(CurvedAnimation(
                parent: _animationController,
                curve: Interval(0, 0.5, curve: Curves.easeIn)));
  }

  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;

    _signIn() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeModule()));
    }

    _onTap() async {
      if (_animationController.value > 0) {
        _animationController.reverse();
        await Future.delayed(Duration(seconds: 3)).then((onValue) => _signIn());
      } else {
        _animationController.forward();
        await Future.delayed(Duration(seconds: 3)).then((onValue) => _signIn());
      }
    }

    _forgetPass() {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => RecoverPassPage()));
    }

    _signUp() {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => SignupPage()));
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
                  "assets/img/logo_branco.png",
                  width: 180,
                ),
                SizedBox(
                  height: appWidth * 0.2,
                ),
                AnimatedBuilder(
                  animation: animTransformEmail,
                  child: CustomTextField(
                    hintText: "Email",
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
                      hintText: "Senha",
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
                  animation: _animationController,
                  builder: (BuildContext context, Widget child) {
                    return Transform.translate(
                      child: Button(
                          context: context,
                          color: ORANGE,
                          text: "entrar",
                          onTap: _onTap,
                          width: animButtonWidth.value,
                          circular: animButtonSigninCircular.value,
                          isLoading: animButtonTransform.value < 0),
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
                            "Cadastre-se".toUpperCase(),
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        Text("   |   ",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        GestureDetector(
                          onTap: _forgetPass,
                          child: Text(
                            "Esqueci minha senha".toUpperCase(),
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
