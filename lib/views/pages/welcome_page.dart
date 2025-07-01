import 'package:demo_app_10_6_2025/views/pages/login_page.dart';
import 'package:demo_app_10_6_2025/views/pages/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    // double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            //child: //FittedBox(
            //fit: BoxFit.cover,
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) =>
                  FractionallySizedBox(
                    //widthFactor: constraints.maxWidth > 500 ? 0.5 : 0.5,
                    widthFactor: widthScreen > 500 ? 0.5 : 0.5, //without
                    //heightFactor: heightScreen > 500 ? 0.5 : 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('asset/lotties/Animation.json'),
                        Text(
                          'Flutter App',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            letterSpacing: 20.0,
                          ),
                        ),
                        FilledButton(
                          key: Key('filledbutton'),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage(title: 'Login');
                                },
                              ),
                            );
                          },
                          style: FilledButton.styleFrom(
                            minimumSize: Size(double.infinity, 40.0),
                          ),
                          child: Text('Get started'),
                        ),
                        TextButton(
                          key: Key('welcome_page_textbutton'),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WeidgetTree();
                                },
                              ),
                            );
                          },
                          child: Text('Get view'),
                        ),
                      ],
                    ),
                  ),
            ),
            //),
          ),
        ),
      ),
    );
  }
}
