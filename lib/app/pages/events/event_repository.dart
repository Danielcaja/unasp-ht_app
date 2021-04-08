import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/events/models/event_model.dart';
import 'package:unasp_ht/app/pages/login/signup/enums/category_enum.dart';

class EventRepository {
  final FirebaseFirestore _firestore;

  AppBloc appBloc = AppModule.to.getBloc<AppBloc>();

  EventRepository(this._firestore);

  Future<List<Events>> getEvents() async {
    try {
      QuerySnapshot snapshot;

      if (appBloc.currentUser.value.mainCategory == CategoryEnum.Admin) {
        snapshot = await _firestore.collection('events').get();
      } else {
        snapshot = await _firestore
            .collection('Events')
            .where('userId', isEqualTo: appBloc.currentUser.value.uid)
            .get();
      }

      if (snapshot == null || snapshot.docs == null) {
        return null;
      }
      return snapshot.docs
          .map((f) =>
              Events.fromJson(f.data()..addAll(<String, dynamic>{'id': f.id})))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<bool> post(Events model) async {
    try {
      await FirebaseFirestore.instance
          .collection('events')
          .doc()
          .set(model.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> put(Events model) async {
    try {
      await FirebaseFirestore.instance
          .collection('Events')
          .doc(model.id.toString())
          .set(model.toJson());

      return true;
    } catch (e) {
      return false;
    }
  }
}
