

import 'package:flutter_test/flutter_test.dart';
import 'package:bibleapp/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("First one som ", ()  {

    testWidgets("First app", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text("Bible App"), findsOneWidget);
      
      await Future.delayed(Duration(seconds: 4));

   //   tester.tap(books);
    });
  });
}
