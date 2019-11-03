import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:unasp_ht/app/pages/login/signin/signin_page.dart';

main() {
  testWidgets('SigninPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(SigninPage()));
    final titleFinder = find.text('Signin');
    expect(titleFinder, findsOneWidget);
  });
}
