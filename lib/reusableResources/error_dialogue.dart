import 'package:flutter/material.dart';

class ErrorDialogueRobo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(
          'There is currently an issue with our service please try again later.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'OK',
          ),
        ),
      ],
    );
  }
}
