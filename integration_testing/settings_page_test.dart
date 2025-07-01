import 'package:demo_app_10_6_2025/views/pages/settings_pages.dart';
import 'package:demo_app_10_6_2025/views/widget/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('SettingsPage Integration Tests with Visual Steps', () {
    testWidgets('setting weiget test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('test snack bar button present in setting pages', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byKey(Key('setting_page_snackbarbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('snack bar'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byType(Divider), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('test droup down button present in setting pages', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_droupbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('element1'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));

      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.text('element1').last);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('element1'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_droupbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.text('element2').last);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('element2'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_droupbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.text('element3').last);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('element3'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('text field test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_textfield')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      await tester.enterText(
        find.byKey(Key('settings_page_textfield')),
        'prasad',
      );
      await Future.delayed(const Duration(seconds: 3));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.text('prasad'), findsWidgets);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('check box check', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_checkbox')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();

      await Future.delayed(const Duration(seconds: 3));
      final Checkbox checkbox = tester.widget(
        find.byKey(Key('settings_page_checkbox')),
      );
      await Future.delayed(const Duration(seconds: 3));

      expect(checkbox.value, isTrue);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('CheckboxListTile cycles through states', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      CheckboxListTile checkbox = tester.widget(
        find.byKey(Key('settings_page_checkboxlisttile')),
      );
      await Future.delayed(const Duration(seconds: 3));
      expect(checkbox.value, isFalse);
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_checkboxlisttile')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      await Future.delayed(const Duration(seconds: 3));
      checkbox = tester.widget(
        find.byKey(Key('settings_page_checkboxlisttile')),
      );
      await Future.delayed(const Duration(seconds: 3));
      expect(checkbox.value, isTrue);
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_checkboxlisttile')));
      await tester.pump();
      await Future.delayed(const Duration(seconds: 3));
      checkbox = tester.widget(
        find.byKey(Key('settings_page_checkboxlisttile')),
      );
      expect(checkbox.value, isNull);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('switch test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      Switch switched = tester.widget(find.byKey(Key('settings_page_switch')));
      await Future.delayed(const Duration(seconds: 3));

      expect(switched.value, isFalse);
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_switch')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      await Future.delayed(const Duration(seconds: 3));

      expect(switched.value, isFalse);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('switch listtiles test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      SwitchListTile switched = tester.widget(
        find.byKey(Key('settings_page_switchlisttile')),
      );
      await Future.delayed(const Duration(seconds: 3));

      expect(switched.value, isFalse);

      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byKey(Key('settings_page_switchlisttile')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();
      await Future.delayed(const Duration(seconds: 3));
      expect(switched.value, isFalse);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('sliderbar test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      final sliderFinder = find.byKey(Key('settings_page_slider'));
      await Future.delayed(const Duration(seconds: 3));

      Slider slider = tester.widget<Slider>(sliderFinder);
      await Future.delayed(const Duration(seconds: 3));
      expect(slider.value, equals(0.0));
      await Future.delayed(const Duration(seconds: 3));

      await tester.drag(sliderFinder, Offset(80.0, 0.0));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();

      await Future.delayed(const Duration(seconds: 3));
      slider = tester.widget(sliderFinder);
      await Future.delayed(const Duration(seconds: 3));
      expect(slider.value, greaterThan(0.0));
      await Future.delayed(const Duration(seconds: 3));
      expect(slider.value, lessThan(8.0));
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('inkwell box test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_inkwell')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('settings_page_inkwell')), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('elevatedbutton test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.ensureVisible(find.byKey(Key('setting_page_backbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byKey(Key('settings_page_ElevatedButton')), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('textbutton test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.ensureVisible(find.byKey(Key('setting_page_backbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byKey(Key('settings_page_TextButton')), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });

    testWidgets('outlinebutton test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.ensureVisible(find.byKey(Key('setting_page_backbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byKey(Key('settings_page_OutlinedButton')), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('filled button test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));
      await tester.ensureVisible(find.byKey(Key('settings_page_FilledButton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings_page_FilledButton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      expect(find.text('Alert Title'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      expect(find.text('hello'), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('hero weidget test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.ensureVisible(find.byKey(Key('setting_page_backbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byType(HeroWidget), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('closebutton test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.ensureVisible(find.byKey(Key('setting_page_backbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byType(CloseButton), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
    testWidgets('back button test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPages()));
      await Future.delayed(const Duration(seconds: 3));

      await tester.ensureVisible(find.byKey(Key('setting_page_backbutton')));
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));

      expect(find.byKey(Key('setting_page_backbutton')), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
    });
  });
}
