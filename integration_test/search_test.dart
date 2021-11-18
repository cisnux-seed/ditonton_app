import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ditonton/main.dart' as app;

void main() {
  // for more information, docs: https://flutter.dev/docs/testing/integration-tests
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('search movies and tv series', () {
    testWidgets(
        'should return movies or tv series list when movie or tv series found by keyword',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Now Playing Movies'), findsOneWidget);
      expect(find.text('Popular Movies'), findsOneWidget);
      expect(find.text('Top Rated Movies'), findsOneWidget);
      expect(find.text('On The Air Tv Series'), findsOneWidget);
      expect(find.text('Popular Tv Series'), findsOneWidget);
      expect(find.text('Top Rated Tv Series'), findsOneWidget);
      expect(find.byType(ListView), findsNWidgets(6));

      var search = find.byIcon(Icons.search);
      await tester.tap(search);
      await tester.pumpAndSettle();

      var textField = find.byType(TextField);

      await tester.enterText(textField, 'the flash');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pumpAndSettle(Duration(seconds: 1));

      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
