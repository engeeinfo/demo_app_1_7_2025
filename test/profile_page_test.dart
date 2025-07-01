import 'package:demo_app_10_6_2025/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('profile page test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfilePage()));
    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsOneWidget);

    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();
    expect(find.text('Flutter App'), findsOneWidget);
  });
}
