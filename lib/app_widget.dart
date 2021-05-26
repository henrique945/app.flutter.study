import 'package:flutter/material.dart';
import 'package:hello/app_controller.dart';

import 'login_page.dart';

// Widget Imutavel
class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              brightness: Brightness.dark,
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.deepPurple,
              )),
          themeMode: ThemeMode.dark,
          home: LoginPage(),
        );
      },
    );
  }
}
