import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unasp_ht/app/pages/departures/components/departure_card.dart';
import 'package:unasp_ht/app/pages/departures/departures_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';
import 'package:unasp_ht/app/pages/departures/pages/new_departure/new_departure_page.dart';
import 'package:unasp_ht/app/pages/login/signup/components/loading_widget.dart';

class DeparturesPage extends StatefulWidget {
  @override
  _DeparturesPageState createState() => _DeparturesPageState();
}

class _DeparturesPageState extends State<DeparturesPage> {
  final DeparturesBloc _bloc = DeparturesModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saídas'.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            StreamBuilder<List<Departure>>(
              stream: _bloc.departures,
              builder: (c, s) {
                if (!s.hasData) {
                  return Center(
                    child: LoadingWidget(),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (c, i) => DepartureCard(departure: s.data[i]),
                  itemCount: s.data.length,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () => Navigator.of(context).push<CupertinoPageRoute>(
          CupertinoPageRoute(
            builder: (context) => NewDeparturePage(),
          ),
        ),
      ),
    );
  }
}
