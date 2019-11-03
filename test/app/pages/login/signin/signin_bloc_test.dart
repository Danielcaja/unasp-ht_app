import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:unasp_ht/app/pages/login/signin/signin_bloc.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';

void main() {
  initModule(LoginModule());
  SigninBloc bloc;

  setUp(() {
    bloc = LoginModule.to.bloc<SigninBloc>();
  });

  group('SigninBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<SigninBloc>());
    });
  });
}
