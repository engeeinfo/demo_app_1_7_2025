import 'package:demo_app_10_6_2025/views/pages/login_page.dart';
import 'package:demo_app_10_6_2025/views/widget/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('hero widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage(title: 'Login')));
    await tester.pumpAndSettle();

    expect(find.byType(HeroWidget), findsOneWidget);
  });

  testWidgets(' login test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage(title: 'Login')));
    await tester.pumpAndSettle();

    final emailfield = find.byKey(Key('login_page_email'));
    final passwordfield = find.byKey(Key('login_page_password'));
    final loginButton = find.byKey(Key('login_page_loginbutton'));

    await tester.ensureVisible(loginButton);
    await tester.pump();

    await tester.enterText(emailfield, 'test@gmail.com');
    await tester.enterText(passwordfield, '123');

    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    expect(find.byType(FractionallySizedBox), findsOneWidget);
  });

  testWidgets('backbutton test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage(title: 'Login')));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('login_page_textbutton')), findsOneWidget);

    await tester.ensureVisible(find.byKey(Key('login_page_textbutton')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('login_page_textbutton')));
    await tester.pumpAndSettle();
    expect(find.text('Flutter App'), findsOneWidget);
  });
}
