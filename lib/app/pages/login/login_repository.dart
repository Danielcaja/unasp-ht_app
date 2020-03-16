import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unasp_ht/app/pages/login/models/user_model.dart';

class LoginRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;

  signUp(UserModel model) async {
    try {
      firebaseUser = await _auth.createUserWithEmailAndPassword(
          email: model.email, password: model.password);

      await Firestore.instance
          .collection("users")
          .document(firebaseUser.uid)
          .setData(model.toJson());
      return null;
    } catch (e) {
      return e?.message ?? "erro";
    }
  }
}
