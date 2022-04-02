import 'package:flutter/material.dart';
import 'package:robo_front/utils/constants.dart';

class InfoDialogueRobo extends StatelessWidget {
  const InfoDialogueRobo({required this.title, required this.content});

  final String title, content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$title'),
      content: Text('$content'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text(
            'OK',
            style: TextStyle(color: kAppColourGreen),
          ),
        ),
      ],
    );
  }
}
