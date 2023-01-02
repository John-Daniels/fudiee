import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudiee/themes/app_colors.dart';

class CartActionButtons extends StatelessWidget {
  const CartActionButtons({
    Key? key,
    required this.itemCount,
    required this.onReduce,
    required this.onAdd,
  }) : super(key: key);

  final num itemCount;
  final VoidCallback onReduce;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onReduce,
          icon: Icon(
            CupertinoIcons.minus_circle_fill,
            size: 32,
            color: Colors.grey.shade600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            '$itemCount',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        IconButton(
          onPressed: onAdd,
          icon: Icon(
            Icons.add_circle_rounded,
            size: 32,
            color: pinkColor,
          ),
        ),
      ],
    );
  }
}
