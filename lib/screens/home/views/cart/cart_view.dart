import 'package:flutter/material.dart';
import 'package:fudiee/controllers/cart/cart_controller.dart';
import 'package:fudiee/screens/home/views/cart/components/cartitem/cart_item.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      id: 'cart_view',
      builder: (state) {
        return Scaffold(
          body: SizedBox.expand(
            child: PageView.builder(
              restorationId: 'cart_view',
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final cart = state.cartItems[index];
                return CartItem(
                  index: index,
                  title: cart.title,
                  desc: cart.desc,
                  image: cart.image,
                  price: cart.price,
                  rating: cart.rating,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
