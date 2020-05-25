import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasp_ht/app/pages/home/models/news_model.dart';

class HomeRepository {
  final Firestore _firestore;

  HomeRepository(this._firestore);

  Future<List<News>> getNews() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('news').getDocuments();

      if (snapshot == null || snapshot.documents == null) {
        return null;
      }
      return snapshot.documents.map((f) => News.fromJson(f.data)).toList();
    } catch (e) {
      return null;
    }
  }
}
