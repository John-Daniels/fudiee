import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudiee/controllers/cart/cart_controller.dart';
import 'package:fudiee/screens/home/views/cart/components/cartitem/components/cart_action_buttons.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:get/get.dart';

class BuildPriceAndCartActions extends StatelessWidget {
  const BuildPriceAndCartActions({
    Key? key,
    required this.price,
    required this.index,
  }) : super(key: key);

  final double price;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      id: 'cart_item_action_widget',
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${price.round()}',
                  style: TextStyle(
                    fontSize: 30,
                    color: pinkColor,
                  ),
                ),
                CartActionButtons(
                  itemCount: state.cartItems[index].itemCount,
                  onAdd: () => state.onIncreaseItemCount(index),
                  onReduce: () => state.onDecreaseItemCount(index),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
