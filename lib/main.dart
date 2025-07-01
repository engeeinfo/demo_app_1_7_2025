import 'package:demo_app_10_6_2025/data/constant.dart';
import 'package:demo_app_10_6_2025/data/notifiers.dart';
import 'package:demo_app_10_6_2025/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    intiTheammode();
    super.initState();
  }

  void intiTheammode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(KConstants.themeModeKey);
    isDarkModeNotification.value = repeat ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotification,
      builder: (context, isDarkMode, child) {
        return SafeArea(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: isDarkMode ? Brightness.light : Brightness.dark,
              ),
            ),
            home: WelcomePage(),
          ),
        );
      },
    );
  }
}
