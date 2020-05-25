import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

class DeparturesRepository {
  final Firestore _firestore;

  AppBloc appBloc = AppModule.to.getBloc<AppBloc>();

  DeparturesRepository(this._firestore);

  Future<List<Departure>> getDepartures() async {
    try {
      QuerySnapshot snapshot;

      if (appBloc.currentUser.value.mainCategory == CategoryEnum.Admin) {
        snapshot = await _firestore.collection('departures').getDocuments();
      } else {
        snapshot = await _firestore
            .collection('departures')
            .where('userId', isEqualTo: appBloc.currentUser.value.uid)
            .getDocuments();
      }

      if (snapshot == null || snapshot.documents == null) {
        return null;
      }
      return snapshot.documents
          .map((f) => Departure.fromJson(
              f.data..addAll(<String, dynamic>{'id': f.documentID})))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<bool> post(Departure model) async {
    try {
      await Firestore.instance
          .collection('departures')
          .document()
          .setData(model.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> put(Departure model) async {
    try {
      await Firestore.instance
          .collection('departures')
          .document(model.id)
          .setData(model.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }
}
