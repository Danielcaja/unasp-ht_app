import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:unasp_ht/app/app_bloc.dart';
import 'package:unasp_ht/app/app_module.dart';
import 'package:unasp_ht/app/pages/login/models/user_model.dart';

class LoginRepository {
  final FirebaseAuth _auth;
  final Firestore _firestore;

  AuthResult firebaseUser;
  AppBloc bloc = AppModule.to.getBloc();

  LoginRepository(this._auth, this._firestore);

  signUp(UserModel model) async {
    try {
      firebaseUser = await _auth.createUserWithEmailAndPassword(
          email: model.email, password: model.password);

      await Firestore.instance
          .collection("users")
          .document(firebaseUser.user.uid)
          .setData(model.toJson());
      return null;
    } catch (e) {
      String message;
      switch (e.code) {
        case "ERROR_WEAK_PASSWORD":
          message = "Ooops, senha precisa ser com + de 6 caracteres";
          break;
        case "ERROR_INVALID_EMAIL":
          message = "Ooops, o email está inválido!";
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          message = "Oops, já tem gente usando esse email aí!";
          break;
        default:
          message = e.message ?? "Oops!";
      }
      return message ?? "erro";
    }
  }

  recoverPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } catch (e) {
      String message;
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          message = "Ooops, o email está inválido!";
          break;
        case "ERROR_USER_NOT_FOUND":
          message = "Não conseguimos te encontrar aqui na base, desculpa!";
          break;
        default:
          message = e.message ?? "Oops!";
      }
      return message ?? "erro";
    }
  }

  login(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        DocumentSnapshot snapshot = await _firestore
            .collection("users")
            .document(result.user.uid)
            .get();
        Map<String, dynamic> data = snapshot.data;
        data["uid"] = result.user.uid;
        bloc.currentUser.add(UserModel.fromJson(data));
      }
      return null;
    } catch (e) {
      return "Usuário e/ou senha incorretos";
    }
  }
}
