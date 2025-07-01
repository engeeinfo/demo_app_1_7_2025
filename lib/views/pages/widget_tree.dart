import 'package:demo_app_10_6_2025/data/constant.dart';
import 'package:demo_app_10_6_2025/data/notifiers.dart';
import 'package:demo_app_10_6_2025/views/pages/calculator_page.dart';
import 'package:demo_app_10_6_2025/views/pages/home_page.dart';
import 'package:demo_app_10_6_2025/views/pages/profile_page.dart';
import 'package:demo_app_10_6_2025/views/pages/settings_pages.dart';
import 'package:demo_app_10_6_2025/views/widget/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = <Widget>[HomePage(), ProfilePage(), CalculatorPage()];

class WeidgetTree extends StatefulWidget {
  const WeidgetTree({super.key});

  @override
  State<WeidgetTree> createState() => _WeidgetTreeState();
}

class _WeidgetTreeState extends State<WeidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Demo_app'),
        actions: [
          IconButton(
            key: Key('widget_tree_iconbutton_dark_mode'),
            onPressed: () async {
              isDarkModeNotification.value = !isDarkModeNotification.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.themeModeKey,
                isDarkModeNotification.value,
              );
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotification,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode);
              },
            ),
          ),
          IconButton(
            key: Key('widget_tree_iconbutton_settings'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPages();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
      ),
      bottomNavigationBar: NavbarWidget(),
      body: ValueListenableBuilder(
        valueListenable: selectdPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(value);
        },
      ),
    );
  }
}
