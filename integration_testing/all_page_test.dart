import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test_preview/integration_test_binding.dart';
import 'home_page_test.dart' as home_page_test;
import 'login_page_test.dart' as login_page_test;
import 'profile_page_test.dart' as profile_page_test;
import 'settings_page_test.dart' as settings_page_test;
import 'welcome_page_test.dart' as welcome_page_test;
import 'widget_tree_test.dart' as widget_tree_test;

void main() {
  IntegrationTestPreviewBinding.ensureInitialized();
  group('test all pages', () {
    welcome_page_test.main();
    widget_tree_test.main();
    home_page_test.main();
    settings_page_test.main();
    login_page_test.main();
    profile_page_test.main();
  });
}
