import 'package:flutter/material.dart';

import 'app_controller.dart';
import 'home_page.dart';
import 'login_page.dart';

class AppWidget extends StatelessWidget {
  final String title;
  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.red,
                brightness: AppController.instance.isDartTheme
                    ? Brightness.dark
                    : Brightness.light,
              ),
              // home: LoginPage(),
              initialRoute: '/',
              routes: {
                '/': (context) => LoginPage(),
                '/home': (context) => HomePage(),
              });
        },
      ),
      // HomePage(),
    );
  }
}
