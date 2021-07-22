import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:robo_front/utils/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({this.setColor});

  final Color setColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: kAppColourGreen,
          size: 75.0,
        ),
      ),
    );
  }
}
