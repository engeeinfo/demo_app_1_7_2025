import 'package:demo_app_10_6_2025/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ProfilePage Integration Tests with Visual Steps', () {
    testWidgets('taps ListTile and navigates', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      final listTileFinder = find.byType(ListTile);
      expect(listTileFinder, findsWidgets);

      final scrollable = find.byType(Scrollable);
      await tester.scrollUntilVisible(
        listTileFinder.first,
        200,
        scrollable: scrollable,
      );

      await tester.tap(listTileFinder.first);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Flutter App'), findsOneWidget);
    });
  });
}
