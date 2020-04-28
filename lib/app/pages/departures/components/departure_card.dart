import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/departures/departures_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';
import 'package:unasp_ht/app/pages/departures/pages/departure_details/departure_detail_page.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

import '../../../app_bloc.dart';

class DepartureCard extends StatelessWidget {
  final Departure departure;

  const DepartureCard({Key key, @required this.departure}) : super(key: key);

  Color getDepartureStatusColor(DepartureStatus status) {
    Color color;
    switch (status) {
      case DepartureStatus.solicitado:
        color = Colors.orange;
        break;
      case DepartureStatus.rejeitado:
        color = Colors.redAccent;
        break;
      case DepartureStatus.aprovado:
        color = Colors.green;
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = AppModule.to.getBloc<AppBloc>();
    DeparturesBloc departureBloc =
        DeparturesModule.to.getBloc<DeparturesBloc>();
    return GestureDetector(
      onTap: () => Navigator.of(context).push<CupertinoPageRoute>(
        CupertinoPageRoute(
          builder: (context) => DepartureDetailPage(
            departure: departure,
          ),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(minHeight: 150),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: getDepartureStatusColor(departure.status),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              constraints: BoxConstraints(minHeight: 150),
              width: 15,
              height: 150,
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              constraints: BoxConstraints(minHeight: 150),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'ida: '.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(DateFormat('dd/MM/yy')
                                .format(departure.going ?? DateTime.now()))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'volta: '.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            Text(DateFormat('dd/MM/yy')
                                .format(departure.turning ?? DateTime.now()))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  departure.location?.toUpperCase() ?? '',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.infoCircle,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  departure.reason?.toUpperCase() ?? '',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.userAlt,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  departure.userName?.toUpperCase() ?? '',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.idCard,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  departure.ra?.toUpperCase() ?? '',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Visibility(
                    visible: appBloc.currentUser.value.mainCategory !=
                            CategoryEnum.Admin ||
                        departure.status != DepartureStatus.solicitado,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Center(
                        child: Text(departure.status
                                .toString()
                                .substring(
                                    departure.status.toString().indexOf('.') +
                                        1)
                                .toUpperCase() ??
                            ''),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: appBloc.currentUser.value.mainCategory ==
                            CategoryEnum.Admin &&
                        departure.status == DepartureStatus.solicitado,
                    child: Container(
                      constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * .7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          button(
                            'reprovar',
                            Colors.red,
                            FontAwesomeIcons.times,
                            () async => await departureBloc.put(
                              departure..status = DepartureStatus.rejeitado,
                            ),
                          ),
                          VerticalDivider(),
                          button(
                            'aprovar',
                            Colors.green,
                            FontAwesomeIcons.check,
                            () async => await departureBloc.put(
                              departure..status = DepartureStatus.aprovado,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget button(String text, Color color, IconData icon, Function onTap) =>
    GestureDetector(
      onTap: () => onTap(),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: color,
            size: 14,
          ),
          const SizedBox(width: 10),
          Text(
            text?.toUpperCase(),
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
