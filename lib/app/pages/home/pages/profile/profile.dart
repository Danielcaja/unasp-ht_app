import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';
import 'package:unasp_ht/app/shared/utils/string_extensions.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color get primaryColor => Theme.of(context).primaryColor;
  AppBloc bloc = AppModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    String genre =
        bloc.currentUser.value.genre == 'f' ? 'Feminino' : 'Masculino';
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        image: NetworkImage(bloc.currentUser.value?.imagePath ??
                            'https://vectorified.com/images/facebook-no-photo-icon-20.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  child: Column(
                    children: <Widget>[
                      Labeled(
                        label: 'nome',
                        text: bloc.currentUser.value.name,
                        icon: FontAwesomeIcons.userAlt,
                        inline: false,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Visibility(
                        visible: !bloc.currentUser.value.ra.isNullOrEmpty,
                        child: Column(
                          children: <Widget>[
                            Labeled(
                              label: 'ra',
                              text: bloc.currentUser.value.ra,
                              icon: FontAwesomeIcons.idCard,
                              inline: false,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                      Labeled(
                        label: 'email',
                        text: bloc.currentUser.value.email,
                        icon: FontAwesomeIcons.solidEnvelope,
                        inline: false,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Labeled(
                        label: 'gênero',
                        text: genre,
                        icon: FontAwesomeIcons.venusMars,
                        inline: false,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Labeled(
                        label: 'categorias',
                        text:
                            '${stringValue(bloc.currentUser.value.mainCategory.index)} \n${stringValue(bloc.currentUser.value.secondaryCategory?.index)}',
                        icon: FontAwesomeIcons.infoCircle,
                        inline: false,
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
