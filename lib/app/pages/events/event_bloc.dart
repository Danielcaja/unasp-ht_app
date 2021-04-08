import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';
import 'package:unasp_ht/app/pages/events/models/event_model.dart';

class EventBloc extends BlocBase {
  final EventRepository _repository;

  EventBloc(this._repository) {
    getEvents();
  }

  final BehaviorSubject<List<Events>> events = BehaviorSubject<List<Events>>();

  void getEvents() => _repository.getEvents().then((onValue) {
        events.add(onValue);
      });

  Future put(Events model) async {
    await _repository.put(model);
    await getEvents();
  }

  @override
  void dispose() {
    events.close();
    super.dispose();
  }
}
