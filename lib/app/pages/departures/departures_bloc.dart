import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/pages/departures/departures_repository.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';

class DeparturesBloc extends BlocBase {
  final DeparturesRepository _repository;

  DeparturesBloc(this._repository) {
    getDepartures();
  }

  final BehaviorSubject<List<Departure>> departures =
      BehaviorSubject<List<Departure>>();

  void getDepartures() => _repository.getDepartures().then((onValue) {
        departures.add(onValue);
      });

  @override
  void dispose() {
    departures.close();
    super.dispose();
  }
}
