import 'package:demo_app_10_6_2025/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_preview/integration_test_binding.dart';

void main() {
  IntegrationTestPreviewBinding.ensureInitialized();
  testWidgets('fractional size box test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    await tester.pumpAndSettle();
    expect(find.byType(FractionallySizedBox), findsOneWidget);
  });
  testWidgets('flxible image widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('home_page_imageflexiable')), findsOneWidget);
  });
  testWidgets('flxible slider widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    await tester.pumpAndSettle();
    expect(find.byKey(Key('home_page_sliderflexiable')), findsOneWidget);
  });
  testWidgets('Zoom test ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));
    await tester.pumpAndSettle();

    final sliderFinder = find.byKey(Key('home_page_sliderflexiable'));
    final viewerFinder = find.byKey(Key('home_page_imageflexiable'));

    final InteractiveViewer viewerWidget = tester.widget<InteractiveViewer>(
      viewerFinder,
    );
    final initialMatrix = viewerWidget.transformationController?.value;
    final initialScale = initialMatrix?.getMaxScaleOnAxis() ?? 1.0;

    await tester.drag(sliderFinder, Offset(150, 0));
    await tester.pumpAndSettle();

    final updatedViewerWidget = tester.widget<InteractiveViewer>(viewerFinder);
    final updatedMatrix = updatedViewerWidget.transformationController?.value;
    final updatedScale = updatedMatrix?.getMaxScaleOnAxis() ?? 1.0;

    expect(updatedScale, greaterThan(initialScale));
  });
}
