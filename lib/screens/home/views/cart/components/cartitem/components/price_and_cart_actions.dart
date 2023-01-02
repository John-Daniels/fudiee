import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudiee/screens/home/views/cart/components/cartitem/components/cart_action_buttons.dart';
import 'package:fudiee/themes/app_colors.dart';

class BuildPriceAndCartActions extends StatefulWidget {
  const BuildPriceAndCartActions({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;

  @override
  State<BuildPriceAndCartActions> createState() =>
      _BuildPriceAndCartActionsState();
}

class _BuildPriceAndCartActionsState extends State<BuildPriceAndCartActions> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${widget.price.round()}',
              style: TextStyle(
                fontSize: 30,
                color: pinkColor,
              ),
            ),
            CartActionButtons(
              itemCount: itemCount,
              onAdd: () {
                itemCount++;
                setState(() {});
              },
              onReduce: () {
                if (itemCount > 1) itemCount--;
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
