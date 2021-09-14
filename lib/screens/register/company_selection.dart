import 'package:flutter/material.dart';
import 'package:robo_front/model/company_creation/company_creation.dart';
import 'package:robo_front/reusableResources/rounded_button.dart';
import 'package:robo_front/screens/loading_screen.dart';
import 'package:robo_front/screens/register/company_registration.dart';
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
              title: 'Company Creation',
              onPunch: () {
                Navigator.pushNamed(context, LoadingScreen.id);
              },
              color: kAppColourBlue,
            ),
            RoundedButton(
              title: 'Company Registration',
              onPunch: () {
                Navigator.pushNamed(context, CompanyRegistration.id);
              },
              color: kAppColourGreen,
            ),
          ],
        ),
      ),
    );
  }
}
