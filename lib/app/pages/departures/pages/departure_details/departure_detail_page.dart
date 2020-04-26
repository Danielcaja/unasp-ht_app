import 'package:flutter/material.dart';
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
                label: 'Ida: ',
                text: DateFormat('dd/MM/yy - HH:mm').format(
                      widget.departure.going ?? DateTime.now(),
                    ) +
                    'h',
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Volta: ',
                text: DateFormat('dd/MM/yy - HH:mm').format(
                      widget.departure.turning ?? DateTime.now(),
                    ) +
                    'h',
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Motivo: ',
                text: widget.departure.reason,
              ),
              const SizedBox(height: 8),
              Labeled(
                label: 'Status: ',
                text: widget.departure.status
                    .toString()
                    .substring(
                        widget.departure.status.toString().indexOf('.') + 1)
                    .toUpperCase(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
