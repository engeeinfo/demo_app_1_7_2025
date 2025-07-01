import 'package:demo_app_10_6_2025/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('HomePage Integration Tests with Visual Steps', () {
    testWidgets('1. Show FractionallySizedBox', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      expect(find.byType(FractionallySizedBox), findsWidgets);
    });

    testWidgets('2. Show Flexible Image widget by Key', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      final imageFinder = find.byKey(const Key('home_page_imageflexiable'));
      expect(imageFinder, findsOneWidget);
    });

    testWidgets('3. Show Flexible Slider widget by Key', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      final sliderFinder = find.byKey(const Key('home_page_sliderflexiable'));
      expect(sliderFinder, findsOneWidget);
    });

    testWidgets('4. Zoom test on InteractiveViewer via Slider Drag', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      final sliderFinder = find.byKey(const Key('home_page_sliderflexiable'));
      final viewerFinder = find.byKey(const Key('home_page_imageflexiable'));

      expect(sliderFinder, findsOneWidget);
      expect(viewerFinder, findsOneWidget);

      final InteractiveViewer initialViewer = tester.widget(viewerFinder);
      final initialMatrix = initialViewer.transformationController?.value;
      final initialScale = initialMatrix?.getMaxScaleOnAxis() ?? 1.0;

      await tester.pump(const Duration(seconds: 1));
      await tester.drag(sliderFinder, const Offset(100, 0));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      final InteractiveViewer updatedViewer = tester.widget(viewerFinder);
      final updatedMatrix = updatedViewer.transformationController?.value;
      final updatedScale = updatedMatrix?.getMaxScaleOnAxis() ?? 1.0;

      expect(updatedScale, greaterThan(initialScale));
    });
  });
}
