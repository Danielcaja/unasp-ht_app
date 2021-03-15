import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/pages/menu/menu_item_model.dart';

class MenuBloc extends BlocBase {
  final BehaviorSubject<List<MenuItem>> menuController =
      BehaviorSubject<List<MenuItem>>();

  MenuBloc() {
    getPhones().then((menu) => menuController.add(menu));
  }

  Future<List<MenuItem>> getPhones() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('menu').get();

      if (snapshot == null || snapshot.docs == null) {
        return null;
      }
      return snapshot.docs
          .map((f) => MenuItem.fromJson(
              f.data()..addAll(<String, dynamic>{'id': f.id})))
          .toList();
    } catch (e) {
      return null;
    }
  }

  Future<bool> like(MenuItem model) async {
    try {
      int index =
          menuController.value.indexWhere((test) => test.name == model.name);

      model.likes = model.likes + 1;

      await FirebaseFirestore.instance
          .collection('menu')
          .doc(model?.id)
          .set(model.toJson());

      model.wasLiked = true;
      model.wasDisliked = false;

      menuController.add(menuController.value
        ..removeAt(index)
        ..insert(index, model));

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> dislike(MenuItem model) async {
    try {
      int index =
          menuController.value.indexWhere((test) => test.name == model.name);

      model.dislikes = model.dislikes + 1;

      await FirebaseFirestore.instance
          .collection('menu')
          .doc(model?.id)
          .set(model.toJson());

      model.wasLiked = false;
      model.wasDisliked = true;

      menuController.add(menuController.value
        ..removeAt(index)
        ..insert(index, model));

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    menuController.close();
    super.dispose();
  }
}
