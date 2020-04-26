import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';
import 'package:unasp_ht/app/pages/home/components/rectangular_home_button.dart';
import 'package:unasp_ht/app/pages/home/components/square_home_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double appWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: appWidth * .1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SquareHomeButton(
                  'Aluno',
                  Color(0xFF34495E),
                  FontAwesomeIcons.userGraduate,
                  () {},
                ),
                SquareHomeButton(
                  'saídas',
                  Color(0xFF6FBFCC),
                  FontAwesomeIcons.signOutAlt,
                  () => Navigator.of(context).push<CupertinoPageRoute>(
                    CupertinoPageRoute(
                      builder: (context) => DeparturesModule(),
                    ),
                  ),
                ),
                SquareHomeButton('cardápio', Color(0xFF9A735C),
                    FontAwesomeIcons.utensils, () {})
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SquareHomeButton(
                    'portais', Color(0xFF818CD3), FontAwesomeIcons.link, () {}),
                SquareHomeButton('mapa', Color(0xFF7DB760),
                    FontAwesomeIcons.mapMarkedAlt, () {}),
                SquareHomeButton('ramais', Color(0xFFFFAB91),
                    FontAwesomeIcons.phoneAlt, () {}),
              ],
            ),
            SizedBox(
              height: appWidth * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RectangularHomeButton('calendário', Color(0xFFC0CA33),
                    FontAwesomeIcons.calendarAlt, () {}),
                RectangularHomeButton('Notícias', Color(0xFF95A5A6),
                    FontAwesomeIcons.bullhorn, () {}),
              ],
            ),
            SizedBox(
              height: appWidth * 0.1,
            ),
            Text(
              'últimas notícias'.toUpperCase(),
            ),
            SizedBox(
              height: 20,
            ),
            _news(context),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _news(BuildContext context) {
  double appWidth = MediaQuery.of(context).size.width;

  return CarouselSlider(
    enableInfiniteScroll: false,
    height: appWidth * .3,
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:
                            5.0, // has the effect of softening the shadow
                      )
                    ]),
                child: Row(
                  children: <Widget>[
                    Image.asset('assets/img/test.png', fit: BoxFit.contain),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'semana da arte'.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                              height: appWidth * .02,
                            ),
                            Text(
                              'Idealizado e coordenado pela direção da Escola de Artes. Foi um evento top!',
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black45),
                            ),
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          );
        },
      );
    }).toList(),
  );
}
