import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unasp_ht/app/pages/login/recover_pass/recover_pass_page.dart';

main() {
  testWidgets('RecoverPassPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(RecoverPassPage()));
    final titleFinder = find.text('RecoverPass');
    expect(titleFinder, findsOneWidget);
  });
}
