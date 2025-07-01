import 'package:demo_app_10_6_2025/views/pages/widget_tree.dart';
import 'package:demo_app_10_6_2025/views/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('WidgetTreePage Integration Tests with Visual Steps', () {
    testWidgets('app bar test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WeidgetTree()));
      await Future.delayed(const Duration(seconds: 3));
      expect(find.text('Demo_app'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('app bar test dark mode on off test', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: WeidgetTree()));
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byKey(Key('widget_tree_iconbutton_dark_mode')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byIcon(Icons.light_mode), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('widget_tree_iconbutton_dark_mode')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byIcon(Icons.dark_mode), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('setting page navigation test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WeidgetTree()));
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byKey(Key('widget_tree_iconbutton_settings')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('ElevatedButton'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));

      await tester.ensureVisible(find.byKey(Key('setting_page_backbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('setting_page_backbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(
        find.byKey(Key('widget_tree_iconbutton_settings')),
        findsOneWidget,
      );
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('navigation bar widget test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WeidgetTree()));
      await Future.delayed(const Duration(seconds: 3));
      expect(find.byType(NavbarWidget), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
  });
}
