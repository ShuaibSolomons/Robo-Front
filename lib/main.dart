import 'package:flutter/material.dart';
import 'package:robo_front/screens/loading_screen.dart';
import 'package:robo_front/screens/authentication/login_screen.dart';
import 'package:robo_front/screens/authentication/registration_screen.dart';
import 'package:robo_front/screens/authentication/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'loading_screen': (context) => LoadingScreen(),
      },
    );
  }
}
