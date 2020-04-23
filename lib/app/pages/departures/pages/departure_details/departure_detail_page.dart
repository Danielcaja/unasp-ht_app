import 'package:flutter/material.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';

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
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[Text("asd")],
              ))),
    );
  }
}
