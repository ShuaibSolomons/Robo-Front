import 'package:flutter/material.dart';
import 'package:robo_front/model/basket_item.dart';
import 'package:robo_front/reusableResources/counter_widget.dart';

class ListItemWidget extends StatelessWidget {
  final BasketItem item;
  final Animation<double> animation;
  final VoidCallback onClicked;

  const ListItemWidget(
      {@required this.item,
      @required this.animation,
      @required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Text(
            '${item.productName}',
            style: TextStyle(color: Colors.black),
          ),
          trailing: GestureDetector(
            onTap: onClicked,
            child: Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.delete,
                color: Colors.red,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
