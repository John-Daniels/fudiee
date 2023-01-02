import 'package:flutter/material.dart';
import 'package:fudiee/constants/data.dart';
import 'package:fudiee/screens/home/views/cart/components/cartitem/cart_item.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        restorationId: 'cart_view',
        itemCount: cartData.length,
        itemBuilder: (context, index) {
          final cart = cartData[index];
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
    );
  }
}
