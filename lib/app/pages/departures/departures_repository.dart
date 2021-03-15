import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

class DeparturesRepository {
  final FirebaseFirestore _firestore;

  AppBloc appBloc = AppModule.to.getBloc<AppBloc>();

  DeparturesRepository(this._firestore);

  Future<List<Departure>> getDepartures() async {
    try {
      QuerySnapshot snapshot;

      if (appBloc.currentUser.value.mainCategory == CategoryEnum.Admin) {
        snapshot = await _firestore.collection('departures').get();
      } else {
        snapshot = await _firestore
            .collection('departures')
            .where('userId', isEqualTo: appBloc.currentUser.value.uid)
            .get();
      }

      if (snapshot == null || snapshot.docs == null) {
        return null;
      }
      return snapshot.docs
          .map((f) => Departure.fromJson(
              f.data()..addAll(<String, dynamic>{'id': f.id})))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<bool> post(Departure model) async {
    try {
      await FirebaseFirestore.instance
          .collection('departures')
          .doc()
          .set(model.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> put(Departure model) async {
    try {
      await FirebaseFirestore.instance
          .collection('departures')
          .doc(model.id)
          .set(model.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }
}
