import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/departures/components/departure_form/departure_form_bloc.dart';
import 'package:unasp_ht/app/pages/departures/departures_module.dart';
import 'package:unasp_ht/app/pages/departures/departures_repository.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';

class NewDepartureBloc extends BlocBase {
  final DeparturesRepository _repository;
  final DepartureFormBloc formBloc =
      DeparturesModule.to.getBloc<DepartureFormBloc>();

  final BehaviorSubject<bool> isLoadingController =
      BehaviorSubject<bool>.seeded(false);

  NewDepartureBloc(this._repository);

  Future<bool> sendDeparture() async {
    isLoadingController.add(true);
    return await _repository.post(
      Departure(
        formBloc.goingDateC.value,
        formBloc.turningDateC.value,
        formBloc.locationController.text,
        formBloc.reasonController.text,
        DepartureStatus.solicitado,
        AppModule.to.getBloc<AppBloc>().currentUser.value.uid,
      ),
    );
  }

  @override
  void dispose() {
    isLoadingController.close();
    super.dispose();
  }
}
