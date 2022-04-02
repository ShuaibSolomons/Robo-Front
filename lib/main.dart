import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:robo_front/reusableResources/loading_widget.dart';
import 'package:robo_front/screens/loading_screen.dart';
import 'package:robo_front/screens/authentication/login_screen.dart';
import 'package:robo_front/screens/authentication/registration_screen.dart';
import 'package:robo_front/screens/authentication/welcome_screen.dart';
import 'package:robo_front/screens/register/company_setup.dart';
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
          return Center(
            child: Text(
              snapshot.data.toString(),
            ),
          );
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
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String firstWidget;

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      firstWidget = LoadingScreen.id;
    } else {
      firstWidget = WelcomeScreen.id;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: this.firstWidget,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
        UserDetail.id: (context) => UserDetail(),
        CompanySelection.id: (context) => CompanySelection(),
        CompanySetup.id: (context) => CompanySetup(),
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
