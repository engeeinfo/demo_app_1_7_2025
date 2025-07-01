import 'package:demo_app_10_6_2025/data/notifiers.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  //int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectdPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Person'),
            NavigationDestination(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
          ],
          onDestinationSelected: (int value) {
            //print(selectedPage);
            selectdPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
