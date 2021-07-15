import 'package:flutter/material.dart';
import 'package:robo_front/utils/Constant.dart';

class CartPurchasePreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: kIconImage,
      ),
      body: Center(
        child: Text("This is the Slip preview screen"),
      ),
    );
  }
}
