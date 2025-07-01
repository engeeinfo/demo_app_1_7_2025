import 'package:demo_app_10_6_2025/main.dart';
import 'package:demo_app_10_6_2025/views/pages/login_page.dart';
import 'package:demo_app_10_6_2025/views/pages/welcome_page.dart';
import 'package:demo_app_10_6_2025/views/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

void main() {
  testWidgets('sample_test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('welcome page test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WelcomePage()));
    expect(find.text('Flutter App'), findsOneWidget);
  });

  testWidgets('lottie image test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WelcomePage()));
    expect(find.byType(Lottie), findsOneWidget);
  });
  testWidgets('filled button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WelcomePage()));
    expect(find.byType(FilledButton), findsOneWidget);
  });
  testWidgets('text button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WelcomePage()));
    expect(find.byType(TextButton), findsOneWidget);
  });
  testWidgets(
    'Navigates to LoginPage on Login button tap and back to same page',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: WelcomePage()));
      expect(find.byKey(const Key('filledbutton')), findsOneWidget);
      await tester.tap(find.byKey(Key('filledbutton')));
      await tester.pumpAndSettle();
      expect(find.byType(LoginPage), findsOneWidget);
    },
  );
  testWidgets('get view test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WelcomePage()));
    await tester.tap(find.byKey(Key('welcome_page_textbutton')));
    await tester.pumpAndSettle();
    //next page found
    expect(find.byType(NavbarWidget), findsOneWidget);
  });
}
