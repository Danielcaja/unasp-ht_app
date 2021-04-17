import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/pages/events/add_event_bloc.dart';
import 'package:unasp_ht/app/pages/events/event_module.dart';
import 'package:unasp_ht/app/pages/events/event_repository.dart';
import 'package:unasp_ht/app/pages/events/models/event_model.dart';

import '../../app_module.dart';

class EventBloc extends BlocBase {
  // o mesmo arquivo que new_departure_bloc
  final EventRepository _repository;
  final EventFormBloc formBloc = EventsModule.to.getBloc<EventFormBloc>();

  final BehaviorSubject<bool> isLoadingController =
      BehaviorSubject<bool>.seeded(false);

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

  Future<bool> sendEvents() async {
    print(AppModule.to.getBloc<AppBloc>().currentUser.value.uid);
    isLoadingController.add(true);
    return await _repository.post(
      Events(
        null,
        AppModule.to.getBloc<AppBloc>().currentUser.value.uid,
        formBloc.descriptionController.text,
        formBloc.ensinoIdController,
        formBloc.courseIdController,
        formBloc.semestreIdController,
        formBloc.startDateC.value,
        formBloc.finalDateC.value,
      ),
    );
  }

  @override
  void dispose() {
    events.close();
    isLoadingController.close();
    super.dispose();
  }
}
