import 'package:flutter/material.dart';
import 'package:robo_front/reusableResources/rounded_button.dart';
import 'package:robo_front/screens/loading_screen.dart';
import 'package:robo_front/screens/register/company_setup.dart';
import 'package:robo_front/utils/constants.dart';

class CompanySelection extends StatelessWidget {
  const CompanySelection();

  static String id = 'company_selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              title: 'Company Registration',
              onPunch: () {
                Navigator.pushNamed(context, LoadingScreen.id);
              },
              color: kAppColourGreen,
            ),
            RoundedButton(
              title: 'Company Creation',
              onPunch: () {
                Navigator.pushNamed(context, CompanySetup.id);
              },
              color: kAppColourBlue,
            ),
          ],
        ),
      ),
    );
  }
}
