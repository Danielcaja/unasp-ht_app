import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:unasp_ht/app/pages/login/models/user_model.dart';

class AppBloc extends BlocBase {
  final BehaviorSubject<UserModel> currentUser = BehaviorSubject<UserModel>();

  @override
  void dispose() {
    currentUser.close();
    super.dispose();
  }
}
