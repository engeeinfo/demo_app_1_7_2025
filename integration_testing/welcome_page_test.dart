import 'package:demo_app_10_6_2025/main.dart';
import 'package:demo_app_10_6_2025/views/pages/login_page.dart';
import 'package:demo_app_10_6_2025/views/pages/welcome_page.dart';
import 'package:demo_app_10_6_2025/views/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lottie/lottie.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('WelcomePage Integration Tests with Visual Steps', () {
    testWidgets('sample_test', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await Future.delayed(const Duration(seconds: 3));
      expect(find.byType(MaterialApp), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('welcome page test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomePage()));
      await Future.delayed(const Duration(seconds: 3));
      expect(find.text('Flutter App'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('lottie image test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomePage()));
      await Future.delayed(const Duration(seconds: 3));
      expect(find.byType(Lottie), findsOneWidget);
    });

    testWidgets('filled button test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomePage()));
      await Future.delayed(const Duration(seconds: 3));
      expect(find.byType(FilledButton), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('text button', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomePage()));
      await Future.delayed(const Duration(seconds: 3));
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets(
      'Navigates to LoginPage on Login button tap and back to same page',
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: WelcomePage()));
        await Future.delayed(const Duration(seconds: 3));
        expect(find.byKey(const Key('filledbutton')), findsOneWidget);
        await Future.delayed(const Duration(seconds: 3));
        await tester.tap(find.byKey(Key('filledbutton')));
        await Future.delayed(const Duration(seconds: 3));
        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 3));
        expect(find.byType(LoginPage), findsOneWidget);
        await Future.delayed(const Duration(seconds: 3));
      },
    );
    testWidgets('get view test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomePage()));
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byKey(Key('welcome_page_textbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      //next page found
      expect(find.byType(NavbarWidget), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
  });
}
