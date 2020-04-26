import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';
import 'package:unasp_ht/app/shared/components/labeled.dart';

class DepartureDetailPage extends StatefulWidget {
  final Departure departure;

  const DepartureDetailPage({Key key, @required this.departure})
      : super(key: key);

  @override
  _DepartureDetailPageState createState() => _DepartureDetailPageState();
}

class _DepartureDetailPageState extends State<DepartureDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.departure.location),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Labeled(
                label: "Ida: ",
                text: DateFormat('dd/MM/yy').format(
                  widget.departure.going ?? DateTime.now(),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Labeled(
                label: "Volta: ",
                text: DateFormat('dd/MM/yy').format(
                  widget.departure.turning ?? DateTime.now(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Labeled(
                icon: FontAwesomeIcons.infoCircle,
                label: "Detalhes: ",
                text: DateFormat('dd/MM/yy').format(
                  widget.departure.turning ?? DateTime.now(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
