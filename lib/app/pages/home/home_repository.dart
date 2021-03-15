import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasp_ht/app/pages/home/models/news_model.dart';

class HomeRepository {
  final FirebaseFirestore _firestore;
  // final Firestore _firestore;

  HomeRepository(this._firestore);

  Future<List<News>> getNews() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('news').get();

      if (snapshot == null || snapshot.docs == null) {
        return null;
      }
      return snapshot.docs.map((f) => News.fromJson(f.data())).toList();
    } catch (e) {
      return null;
    }
  }
}
