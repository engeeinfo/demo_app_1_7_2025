import 'package:demo_app_10_6_2025/views/pages/welcome_page.dart';
import 'package:demo_app_10_6_2025/views/pages/widget_tree.dart';
import 'package:demo_app_10_6_2025/views/widget/hero_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String confirmEmail = 'test@gmail.com';
  String confirmPw = '123';

  // @override
  // void initState() {
  //   print('inti state');
  //   super.initState();
  //   super.initState();
  // }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HeroWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      key: Key('login_page_email'),
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      key: Key('login_page_password'),
                      controller: controllerPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  FilledButton(
                    key: Key('login_page_loginbutton'),
                    onPressed: () {
                      onLoginPressed();
                    },
                    child: Text(widget.title),
                  ),
                  TextButton(
                    key: Key('login_page_textbutton'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WelcomePage();
                          },
                        ),
                      );
                    },
                    child: Text('back'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    if (confirmEmail == controllerEmail.text &&
        confirmPw == controllerPassword.text) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WeidgetTree();
          },
        ),
        (route) => false,
      );
    }
  }
}
