import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:unasp_ht/app/pages/login/recover_pass/recover_pass_bloc.dart';
import 'package:unasp_ht/app/pages/login/login_module.dart';

void main() {
  initModule(LoginModule());
  RecoverPassBloc bloc;

  setUp(() {
    bloc = LoginModule.to.bloc<RecoverPassBloc>();
  });

  group('RecoverPassBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<RecoverPassBloc>());
    });
  });
}
