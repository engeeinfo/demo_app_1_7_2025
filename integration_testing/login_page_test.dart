import 'package:demo_app_10_6_2025/views/pages/login_page.dart';
import 'package:demo_app_10_6_2025/views/widget/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('LoginPage Integration Tests with Visual Steps', () {
    testWidgets('hero widget test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage(title: 'Login')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));

      expect(find.byType(HeroWidget), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });

    testWidgets('login test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage(title: 'Login')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));

      final emailfield = find.byKey(const Key('login_page_email'));
      await tester.pump(const Duration(seconds: 3));
      final passwordfield = find.byKey(const Key('login_page_password'));
      await tester.pump(const Duration(seconds: 3));
      final loginButton = find.byKey(const Key('login_page_loginbutton'));

      await tester.pump(const Duration(seconds: 3));
      await tester.ensureVisible(loginButton);
      await tester.pump(const Duration(seconds: 3));
      await tester.pump();

      await tester.pump(const Duration(seconds: 3));
      await tester.enterText(emailfield, 'test@gmail.com');
      await tester.pump(const Duration(seconds: 3));
      await tester.enterText(passwordfield, '123');
      await tester.pump(const Duration(seconds: 3));

      await tester.tap(loginButton);
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));

      expect(find.byType(FractionallySizedBox), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });

    testWidgets('backbutton test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginPage(title: 'Login')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));

      expect(find.byKey(const Key('login_page_textbutton')), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));

      await tester.ensureVisible(
        find.byKey(const Key('login_page_textbutton')),
      );
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      await tester.pump(const Duration(seconds: 3));
      await tester.tap(find.byKey(const Key('login_page_textbutton')));
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 3));

      expect(find.text('Flutter App'), findsOneWidget);
      await tester.pump(const Duration(seconds: 3));
    });
  });
}
