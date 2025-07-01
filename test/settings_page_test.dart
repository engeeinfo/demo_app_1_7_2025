import 'package:demo_app_10_6_2025/views/pages/settings_pages.dart';
import 'package:demo_app_10_6_2025/views/widget/hero_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('setting weiget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));
    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('test snack bar button present in setting pages', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));
    await tester.tap(find.byKey(Key('setting_page_snackbarbutton')));
    await tester.pumpAndSettle();

    expect(find.text('snack bar'), findsOneWidget);

    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets('test droup down button present in setting pages', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    await tester.tap(find.byKey(Key('settings_page_droupbutton')));
    await tester.pumpAndSettle();

    expect(find.text('element1'), findsOneWidget);

    await tester.tap(find.text('element1').last);
    await tester.pumpAndSettle();

    expect(find.text('element1'), findsOneWidget);

    await tester.tap(find.byKey(Key('settings_page_droupbutton')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('element2').last);
    await tester.pumpAndSettle();

    expect(find.text('element2'), findsOneWidget);

    await tester.tap(find.byKey(Key('settings_page_droupbutton')));
    await tester.pumpAndSettle();

    await tester.tap(find.text('element3').last);
    await tester.pumpAndSettle();

    expect(find.text('element3'), findsOneWidget);
  });
  testWidgets('text field test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    await tester.tap(find.byKey(Key('settings_page_textfield')));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(Key('settings_page_textfield')),
      'prasad',
    );
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    expect(find.text('prasad'), findsWidgets);
  });
  testWidgets('check box check', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    await tester.tap(find.byKey(Key('settings_page_checkbox')));
    await tester.pump();

    final Checkbox checkbox = tester.widget(
      find.byKey(Key('settings_page_checkbox')),
    );

    expect(checkbox.value, isTrue);
  });

  testWidgets('CheckboxListTile cycles through states', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    CheckboxListTile checkbox = tester.widget(
      find.byKey(Key('settings_page_checkboxlisttile')),
    );
    expect(checkbox.value, isFalse);

    await tester.tap(find.byKey(Key('settings_page_checkboxlisttile')));
    await tester.pump();
    checkbox = tester.widget(find.byKey(Key('settings_page_checkboxlisttile')));
    expect(checkbox.value, isTrue);

    await tester.tap(find.byKey(Key('settings_page_checkboxlisttile')));
    await tester.pump();
    checkbox = tester.widget(find.byKey(Key('settings_page_checkboxlisttile')));
    expect(checkbox.value, isNull);
  });
  testWidgets('switch test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    Switch switched = tester.widget(find.byKey(Key('settings_page_switch')));

    expect(switched.value, isFalse);

    await tester.tap(find.byKey(Key('settings_page_switch')));
    await tester.pump();

    expect(switched.value, isFalse);
  });
  testWidgets('switch listtiles test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    SwitchListTile switched = tester.widget(
      find.byKey(Key('settings_page_switchlisttile')),
    );

    expect(switched.value, isFalse);

    await tester.tap(find.byKey(Key('settings_page_switchlisttile')));
    await tester.pump();
    expect(switched.value, isFalse);
  });

  testWidgets('sliderbar test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    final sliderFinder = find.byKey(Key('settings_page_slider'));

    Slider slider = tester.widget<Slider>(sliderFinder);
    expect(slider.value, equals(0.0));

    await tester.drag(sliderFinder, Offset(80.0, 0.0));
    await tester.pump();

    slider = tester.widget(sliderFinder);
    expect(slider.value, greaterThan(0.0));
    expect(slider.value, lessThan(8.0));
  });

  testWidgets('inkwell box test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    expect(find.byKey(Key('settings_page_inkwell')), findsOneWidget);
  });
  testWidgets('elevatedbutton test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    expect(find.byKey(Key('settings_page_ElevatedButton')), findsOneWidget);
  });

  testWidgets('textbutton test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    expect(find.byKey(Key('settings_page_TextButton')), findsOneWidget);
  });

  testWidgets('outlinebutton test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    expect(find.byKey(Key('settings_page_OutlinedButton')), findsOneWidget);
  });
  testWidgets('filled button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));
    await tester.ensureVisible(find.byKey(Key('settings_page_FilledButton')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(Key('settings_page_FilledButton')));
    await tester.pumpAndSettle();
    expect(find.text('Alert Title'), findsOneWidget);
    expect(find.text('hello'), findsOneWidget);
  });
  testWidgets('hero weidget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    expect(find.byType(HeroWidget), findsOneWidget);
  });
  testWidgets('closebutton test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    expect(find.byType(CloseButton), findsOneWidget);
  });
  testWidgets('back button test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsPages()));

    expect(find.byKey(Key('setting_page_backbutton')), findsOneWidget);
  });
}
