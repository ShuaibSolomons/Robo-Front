import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:robo_front/reusableResources/loading_widget.dart';
import 'package:robo_front/screens/loading_screen.dart';
import 'package:robo_front/screens/authentication/login_screen.dart';
import 'package:robo_front/screens/authentication/registration_screen.dart';
import 'package:robo_front/screens/authentication/welcome_screen.dart';
import 'package:robo_front/screens/register/company_registration.dart';
import 'package:robo_front/screens/register/company_selection.dart';
import 'package:robo_front/screens/register/user_detail.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return null;
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
        UserDetail.id: (context) => UserDetail(),
        CompanySelection.id: (context) => CompanySelection(),
        CompanyRegistration.id: (context) => CompanyRegistration(),
      },
    );
  }
}

class Loading extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingWidget(),
    );
  }
}
