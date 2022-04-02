import 'package:flutter/material.dart';

class AmountDisplayWidget extends StatelessWidget {
  const AmountDisplayWidget({required this.totalBasketAmount});

  final double totalBasketAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(),
            child: Center(
              child: Text(
                "R " + totalBasketAmount.toStringAsFixed(2),
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
