import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

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
        bloc.currentUser.value.genre == "F" ? "Feminino" : "Masculino";
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-.2, 0),
                        image: NetworkImage(
                            'https://scontent.fcpq4-1.fna.fbcdn.net/v/t1.0-9/30707760_1749286491806772_7584899922474827776_o.jpg?_nc_cat=104&_nc_sid=85a577&_nc_eui2=AeFelPBhgQa2w1zfCt1tdcmRYhEXVFwxgHxiERdUXDGAfEqCmrxx42bjdoYd4b2bWjhQxpSkfFpVrYbNEnjA1Eyz&_nc_ohc=K01ErHqMU9gAX-SJOvC&_nc_ht=scontent.fcpq4-1.fna&oh=208217428a8607d531daae220883050e&oe=5EBA2E60'),
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
                      textInfo("nome", bloc.currentUser.value.name,
                          primaryColor, FontAwesomeIcons.userAlt),
                      SizedBox(
                        height: 25,
                      ),
                      textInfo("email", bloc.currentUser.value.email,
                          primaryColor, FontAwesomeIcons.solidEnvelope),
                      SizedBox(
                        height: 25,
                      ),
                      textInfo("gênero", genre, primaryColor,
                          FontAwesomeIcons.venusMars),
                      SizedBox(
                        height: 25,
                      ),
                      textInfo(
                          "categorias",
                          "${stringValue(bloc.currentUser.value.mainCategory.index)} \n${stringValue(bloc.currentUser.value.secondaryCategory.index)}",
                          primaryColor,
                          FontAwesomeIcons.infoCircle)
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

Widget textInfo(
        String title, String subtitle, Color primaryColor, IconData icon) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: primaryColor,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              subtitle.toUpperCase(),
              style: TextStyle(color: Colors.black54),
            )
          ],
        )
      ],
    );
