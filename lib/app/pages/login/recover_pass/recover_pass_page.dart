import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuple/tuple.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';
import 'package:unasp_ht/app/pages/login/recover_pass/recover_pass_bloc.dart';
import 'package:unasp_ht/app/pages/login/signup/components/loading_widget.dart';
import 'package:unasp_ht/app/shared/components/button.dart';
import 'package:unasp_ht/app/shared/components/text-field.dart';

class RecoverPassPage extends StatefulWidget {
  @override
  _RecoverPassPageState createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {
  final RecoverPassBloc _bloc = LoginModule.to.getBloc();
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    return StreamBuilder<Tuple2<bool, bool>>(
      stream: _bloc.stream,
      builder: (c, snapshot) {
        return Scaffold(
          key: key,
          appBar: AppBar(
            centerTitle: true,
            leading:
                snapshot.hasData && snapshot.data.item1 ? Container() : null,
            title: Text(
              'Esqueci minha senha'.toUpperCase(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              mainAxisAlignment: snapshot.hasData && snapshot.data.item1
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible: snapshot.hasData && snapshot.data.item1,
                  child: Center(
                    child: LoadingWidget(),
                  ),
                ),
                Visibility(
                  visible: !(snapshot.hasData && snapshot.data.item1),
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        hintText: 'Email',
                        icon: FontAwesomeIcons.solidEnvelope,
                        isPassword: false,
                        isBlue: false,
                        inputType: TextInputType.emailAddress,
                        controller: _bloc.emailController,
                      ),
                      const SizedBox(height: 10),
                      Button(
                        enabled: snapshot.hasData && snapshot.data.item2,
                        context: context,
                        color: orange,
                        text: 'enviar',
                        onTap: () async {
                          String res = await _bloc.send();
                          _bloc.isLoadingController.add(false);

                          if (res == null) {
                            _bloc.emailController.clear();
                            key.currentState.showSnackBar(SnackBar(
                              content:
                                  Text('Feito, agora só olhar no seu email!'),
                              backgroundColor: Colors.green,
                            ));
                          } else {
                            key.currentState.showSnackBar(SnackBar(
                              content: Text(res),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
