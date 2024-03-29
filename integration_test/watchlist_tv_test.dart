import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ditonton/main.dart' as app;

void main() {
  // for more information, docs: https://flutter.dev/docs/testing/integration-tests
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('save watchlist tv', () {
    testWidgets(
        'should added tv to watchlist tv when save watchlist button tapped',
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

      await tester.ensureVisible(find.text('Top Rated Tv Series'));

      var tvList = find.byKey(Key('tv-2')).at(0);
      await tester.tap(tvList);
      await tester.pumpAndSettle();

      var saveWatchlist = find.byType(ElevatedButton);
      expect(saveWatchlist, findsOneWidget);

      await tester.tap(saveWatchlist);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Added to Watchlist'), findsOneWidget);
    });
  });
}
