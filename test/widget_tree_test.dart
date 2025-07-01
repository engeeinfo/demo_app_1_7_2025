import 'package:demo_app_10_6_2025/views/pages/widget_tree.dart';
import 'package:demo_app_10_6_2025/views/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app bar test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WeidgetTree()));
    expect(find.text('Demo_app'), findsOneWidget);
  });

  testWidgets('app bar test dark mode on off test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: WeidgetTree()));
    await tester.tap(find.byKey(Key('widget_tree_iconbutton_dark_mode')));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.light_mode), findsOneWidget);

    await tester.tap(find.byKey(Key('widget_tree_iconbutton_dark_mode')));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
  });

  testWidgets('setting page navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WeidgetTree()));
    await tester.tap(find.byKey(Key('widget_tree_iconbutton_settings')));
    await tester.pumpAndSettle();

    expect(find.text('ElevatedButton'), findsOneWidget);

    await tester.ensureVisible(find.byKey(Key('setting_page_backbutton')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('setting_page_backbutton')));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('widget_tree_iconbutton_settings')), findsOneWidget);
  });

  testWidgets('navigation bar widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WeidgetTree()));
    expect(find.byType(NavbarWidget), findsOneWidget);
  });
}
