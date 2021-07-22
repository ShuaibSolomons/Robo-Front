import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget(
      {@required this.count,
      @required this.addition,
      @required this.subtraction});

  final int count;
  final Function addition, subtraction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Icon(Icons.add), Text("$count"), Icon(Icons.remove)],
    );
  }
}
