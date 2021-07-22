import 'package:flutter/material.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/utils/constants.dart';

class AlertDialogueRobo extends StatelessWidget {
  const AlertDialogueRobo(
      {@required this.clearAnimatedList,
      this.setBasketState,
      @required this.title,
      @required this.content});

  final Function clearAnimatedList;
  final Function setBasketState;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$title'),
      content: Text('$content'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text(
            'Cancel',
            style: TextStyle(color: kAppColourGreen),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Yes');
            clearAnimatedList();
            if (setBasketState != null) {
              setBasketState(0, <BasketItem>[]);
            }
          },
          child: const Text(
            'Yes',
            style: TextStyle(color: kAppColourGreen),
          ),
        )
      ],
    );
  }
}
