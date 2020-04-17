import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/departures/models/departure_model.dart';

class DeparturesRepository {
  final Firestore _firestore;

  AppBloc appBloc = AppModule.to.getBloc<AppBloc>();

  DeparturesRepository(this._firestore);

  Future<List<Departure>> getDepartures() async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection("departures")
          .where("userId", isEqualTo: appBloc.currentUser.value.uid)
          .getDocuments();

      if (snapshot == null || snapshot.documents == null) {
        return null;
      }
      return snapshot.documents.map((f) => Departure.fromJson(f.data)).toList();
    } catch (e) {
      return null;
    }
  }
}
